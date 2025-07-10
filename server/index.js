const express = require('express');
const fs = require('fs');
const path = require('path');
const multer = require('multer');
const cors = require('cors');

const app = express();
const PORT = 5000;
const NOTES_DIR = path.join(__dirname, '../Notes');

// Ensure Notes directory exists
if (!fs.existsSync(NOTES_DIR)) {
  fs.mkdirSync(NOTES_DIR, { recursive: true });
}

app.use(cors({
  origin: 'http://localhost:5173', // Vite dev server default port
  credentials: true
}));
app.use(express.json());

// Multer setup for image uploads
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, NOTES_DIR);
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + '-' + file.originalname);
  }
});
const upload = multer({ storage });

// Save journal entry
app.post('/api/journal', (req, res) => {
  const { filename, content } = req.body;
  if (!filename || !content) return res.status(400).json({ error: 'Missing data' });
  fs.writeFile(path.join(NOTES_DIR, filename + '.txt'), content, err => {
    if (err) return res.status(500).json({ error: 'Failed to save journal' });
    res.json({ success: true });
  });
});

// Load journal entry
app.get('/api/journal/:filename', (req, res) => {
  const filePath = path.join(NOTES_DIR, req.params.filename + '.txt');
  fs.readFile(filePath, 'utf8', (err, data) => {
    if (err) return res.status(404).json({ error: 'Journal not found' });
    res.json({ content: data });
  });
});

// List all journals
app.get('/api/journals', (req, res) => {
  fs.readdir(NOTES_DIR, (err, files) => {
    if (err) return res.status(500).json({ error: 'Failed to list journals' });
    const journals = files.filter(f => f.endsWith('.txt')).map(f => f.replace('.txt', ''));
    res.json({ journals });
  });
});

// Upload image
app.post('/api/upload', upload.single('image'), (req, res) => {
  if (!req.file) return res.status(400).json({ error: 'No file uploaded' });
  res.json({ filename: req.file.filename });
});

// Serve images
app.use('/images', express.static(NOTES_DIR));

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
