# Contributing to Trading Journal App

Thank you for your interest in contributing to the Trading Journal App! We welcome contributions from the community and are grateful for your support.

## 🤝 How to Contribute

### Reporting Issues
- Use the GitHub Issues tab to report bugs or request features
- Search existing issues before creating a new one
- Provide detailed information including:
  - Steps to reproduce the issue
  - Expected vs actual behavior
  - Screenshots if applicable
  - Your operating system and browser version

### Feature Requests
- Check the [roadmap](README.md#-roadmap) to see if your feature is already planned
- Open an issue with the `enhancement` label
- Describe your use case and why the feature would be valuable
- Include mockups or examples if helpful

### Code Contributions

#### Getting Started
1. Fork the repository
2. Clone your fork locally:
   ```bash
   git clone https://github.com/yourusername/trading-journal-app.git
   cd trading-journal-app
   ```
3. Install dependencies:
   ```bash
   npm run install:all
   ```
4. Create a new branch for your feature:
   ```bash
   git checkout -b feature/your-feature-name
   ```

#### Development Workflow
1. Make your changes in the appropriate files
2. Test your changes thoroughly:
   ```bash
   npm run start:both
   ```
3. Follow the existing code style and conventions
4. Write clear, descriptive commit messages
5. Push your changes to your fork:
   ```bash
   git push origin feature/your-feature-name
   ```
6. Open a Pull Request

#### Code Style Guidelines

**React Components:**
- Use functional components with hooks
- Follow the existing file structure in `src/components/`
- Use descriptive component and prop names
- Include appropriate CSS files for styling

**Backend Code:**
- Follow Express.js best practices
- Use proper error handling
- Maintain RESTful API conventions
- Add appropriate comments for complex logic

**CSS/Styling:**
- Maintain the dark theme aesthetic
- Use the existing color scheme and gradients
- Ensure responsive design for all screen sizes
- Follow the glassmorphism and modern UI patterns

#### Testing Your Changes
Before submitting a PR, ensure:
- [ ] Both frontend and backend start without errors
- [ ] All existing functionality still works
- [ ] New features work as expected
- [ ] The UI remains responsive and accessible
- [ ] No console errors or warnings

## 📋 Pull Request Process

1. **Update Documentation**: If your changes affect usage, update the README.md
2. **Describe Your Changes**: Provide a clear description of what your PR does
3. **Link Issues**: Reference any related issues using `Fixes #issue-number`
4. **Screenshots**: Include screenshots for UI changes
5. **Test Instructions**: Provide steps to test your changes

### PR Template
```markdown
## Description
Brief description of the changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
- [ ] Tested locally
- [ ] All existing features still work
- [ ] New feature works as expected

## Screenshots (if applicable)
Add screenshots here

## Related Issues
Fixes #(issue number)
```

## 🎯 Areas for Contribution

### High Priority
- Search functionality for journal entries
- Export to PDF feature
- Performance optimizations
- Accessibility improvements

### Medium Priority
- Additional motivational quotes
- UI/UX enhancements
- Mobile responsiveness improvements
- Error handling improvements

### Low Priority
- Additional themes
- Internationalization
- Advanced features from the roadmap

## 🛠️ Development Setup

### Prerequisites
- Node.js (v16 or higher)
- npm
- Git
- Code editor (VS Code recommended)

### Project Structure
```
src/
├── components/        # React components
│   ├── ChatBox.jsx   # Main editor
│   ├── Sidebar.jsx   # Navigation
│   └── *.css         # Component styles
├── App.jsx           # Main app
└── main.jsx          # Entry point

server/
├── index.js          # Express server
└── package.json      # Backend deps

Notes/                # Data storage
├── *.txt            # Journal files
└── *.jpg/png        # Images
```

### Available Scripts
```bash
# Development
npm run dev                 # Start frontend only
npm run start:backend      # Start backend only
npm run start:both         # Start both servers

# Building
npm run build              # Build for production
npm run preview            # Preview production build

# Utilities
npm run lint               # Run ESLint
npm run install:all        # Install all dependencies
```

## 📞 Getting Help

- **Questions**: Open a GitHub Discussion
- **Bugs**: Create a GitHub Issue
- **Feature Ideas**: Open an issue with the `enhancement` label

## 🏆 Recognition

Contributors will be recognized in:
- The Contributors section of the README
- Release notes for significant contributions
- Special thanks in the changelog

## 📄 License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

Thank you for helping make the Trading Journal App better for traders everywhere! 🚀
