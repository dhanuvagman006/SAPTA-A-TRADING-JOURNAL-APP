
# 📈 Trading Journal App

<div align="center">

![Trading Journal App](https://img.shields.io/badge/Trading-Journal-blue?style=for-the-badge&logo=chart-line)
![React](https://img.shields.io/badge/React-18.3.1-61DAFB?style=for-the-badge&logo=react)
![Node.js](https://img.shields.io/badge/Node.js-Express-339933?style=for-the-badge&logo=node.js)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

**A modern, feature-rich trading journal application built with React and Node.js**

*Track your trades, analyze your performance, and become a better trader*

[Demo](#-screenshots) • [Features](#-features) • [Quick Start](#-quick-start) • [Documentation](#-documentation)

</div>

---

## 🌟 Features

### 📝 **Rich Journal Editor**
- Beautiful dark-themed interface optimized for extended use
- Intuitive chatbox-style editor for writing detailed trading entries
- **Ctrl+Enter** quick save functionality
- Responsive design that works on all devices

### 🖼️ **Image Integration**
- **Paste images directly** from clipboard (Ctrl+V)
- Perfect for adding charts, screenshots, and trade setups
- Automatic image storage and management
- Support for all common image formats

### 📂 **Smart Navigation**
- Elegant sidebar with all your previous journal entries
- **Click-to-load** any previous entry instantly
- Chronological organization with timestamps
- Quick stats and entry count display

### 💪 **Motivational System**
- **20+ rotating inspirational quotes** specifically for traders
- Auto-changing motivational messages every 8 seconds
- Interactive quote navigation
- Designed to keep you motivated during tough trading days

### 🎨 **Modern UI/UX**
- **Dark mode optimized** for comfortable extended use
- Beautiful gradients and smooth animations
- Professional typography with Inter font family
- Glassmorphism effects and backdrop blur
- Custom scrollbars and hover effects

### 💾 **Local File Storage**
- Journals saved as `.txt` files in organized directory structure
- Images stored locally with automatic naming
- No cloud dependency - your data stays private
- Easy backup and data portability

---

## 🚀 Quick Start

### Prerequisites
- **Node.js** (v16 or higher) - [Download here](https://nodejs.org/)
- **npm** (comes with Node.js)

### 🛠️ Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/trading-journal-app.git
   cd trading-journal-app
   ```

2. **Install all dependencies**
   ```bash
   npm run install:all
   ```

3. **Start the application**
   
   **Windows (Recommended):**
   ```bash
   # Option 1: Batch script (opens in separate windows)
   start.bat
   
   # Option 2: PowerShell script (background processes)
   .\start-simple.ps1
   ```
   
   **Cross-platform:**
   ```bash
   # Using npm scripts with concurrently
   npm run start:both
   ```
   
   **Manual start:**
   ```bash
   # Terminal 1 - Backend
   npm run start:backend
   
   # Terminal 2 - Frontend  
   npm run start:frontend
   ```

4. **Open your browser**
   - The app will automatically open at `http://localhost:5173`
   - Backend API runs on `http://localhost:5000`

---

## 📖 How to Use

### ✍️ **Writing Your First Journal Entry**
1. Start typing in the main text area
2. Add charts or screenshots by pasting images (Ctrl+V)
3. Save your entry with Ctrl+Enter or the save button
4. Your entry will appear in the sidebar for future reference

### 🖼️ **Adding Images**
- Copy any image to your clipboard
- Click in the text area and paste (Ctrl+V)
- Images are automatically uploaded and inserted
- Reference appears as `[Image: filename.jpg]` in your text

### 📚 **Managing Entries**
- All entries appear in the left sidebar
- Click any entry to load it in the editor
- Entries are automatically timestamped
- Edit existing entries and save to update them

### 💡 **Pro Tips**
- Use Ctrl+Enter for quick saving
- Paste trading charts directly for quick analysis
- The motivational quotes help maintain a positive mindset
- All data is stored locally in the `Notes/` directory

---

## 🏗️ Project Structure

```
trading-journal-app/
├── 📁 src/                          # React frontend source
│   ├── 📁 components/               # React components
│   │   ├── 📄 ChatBox.jsx          # Main journal editor
│   │   ├── 📄 Sidebar.jsx          # Navigation sidebar  
│   │   ├── 📄 MotivationalWords.jsx # Quote system
│   │   └── 📄 *.css                # Component styles
│   ├── 📄 App.jsx                   # Main app component
│   └── 📄 App.css                   # Global styles
├── 📁 server/                       # Node.js backend
│   ├── 📄 index.js                  # Express server
│   └── 📄 package.json              # Backend dependencies
├── 📁 Notes/                        # Journal storage
│   ├── 📄 *.txt                     # Journal entries
│   └── 🖼️ *.jpg/png                 # Uploaded images
├── 📁 .vscode/                      # VS Code configuration
│   └── 📄 tasks.json                # Development tasks
├── 📄 start.bat                     # Windows batch starter
├── 📄 start-simple.ps1              # PowerShell starter
├── 📄 start.sh                      # Linux/macOS starter
└── 📄 package.json                  # Frontend dependencies
```

---

## 🔧 API Documentation

### Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/api/journals` | List all journal entries |
| `GET` | `/api/journal/:filename` | Get specific journal content |
| `POST` | `/api/journal` | Save new journal entry |
| `POST` | `/api/upload` | Upload image file |
| `GET` | `/images/:filename` | Serve uploaded images |

### Example Usage

```javascript
// Save a journal entry
fetch('http://localhost:5000/api/journal', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({
    filename: 'my-trade-analysis',
    content: 'Today I made a great trade on EURUSD...'
  })
});

// Load all journal entries
fetch('http://localhost:5000/api/journals')
  .then(res => res.json())
  .then(data => console.log(data.journals));
```

---

## 🎨 Screenshots

### Main Interface
*Beautiful dark theme with gradient sidebar and glassmorphism effects*

### Journal Editor
*Spacious editor with image paste support and motivational quotes*

### Sidebar Navigation
*Elegant list of all your trading journal entries with timestamps*

---

## 🛠️ Available Scripts

### Frontend Scripts
```bash
npm run dev          # Start development server
npm run build        # Build for production
npm run preview      # Preview production build
npm run lint         # Run ESLint
```

### Backend Scripts
```bash
npm run start:backend   # Start backend server
npm run start:frontend  # Start frontend server
npm run start:both      # Start both servers
npm run install:all     # Install all dependencies
```

### Utility Scripts
```bash
# Windows
start.bat               # Simple batch file starter
.\start-simple.ps1      # PowerShell starter (recommended)

# Linux/macOS  
./start.sh              # Bash starter
```

---

## 🤝 Contributing

We welcome contributions! Please feel free to submit a Pull Request.

### Development Setup
1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 🗺️ Roadmap

- [ ] **Search functionality** across all journal entries
- [ ] **Trading performance analytics** with charts
- [ ] **Export to PDF** functionality
- [ ] **Light/Dark theme toggle**
- [ ] **Cloud storage integration** (optional)
- [ ] **Mobile app version**
- [ ] **Trading statistics dashboard**
- [ ] **Tag system** for organizing entries
- [ ] **Template system** for common trade setups

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- Built with [React](https://reactjs.org/) and [Vite](https://vitejs.dev/)
- Backend powered by [Node.js](https://nodejs.org/) and [Express](https://expressjs.com/)
- Icons and emojis for beautiful UI
- Inspired by the trading community's need for better journaling tools

---

## 📞 Support

If you have any questions or need help:

- 📧 Open an issue on GitHub
- 💬 Join our discussions
- ⭐ Star this repo if you find it helpful!

---

<div align="center">

**Made with ❤️ for traders, by traders**

⭐ **If this helps your trading journey, please star the repo!** ⭐

</div>
