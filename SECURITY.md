# Security Policy

## Supported Versions

We actively support the following versions of the Trading Journal App:

| Version | Supported          |
| ------- | ------------------ |
| 1.0.x   | :white_check_mark: |

## Reporting a Vulnerability

The security of our users' trading data is extremely important to us. If you discover a security vulnerability, please follow these guidelines:

### 🔒 Responsible Disclosure

**DO NOT** create a public GitHub issue for security vulnerabilities.

Instead, please:

1. **Email us directly** at [security@email.com] (replace with actual email)
2. **Include detailed information** about the vulnerability
3. **Provide steps to reproduce** the issue if possible
4. **Allow us time to respond** before any public disclosure

### 📋 What to Include

When reporting a security vulnerability, please include:

- **Description** of the vulnerability
- **Potential impact** and affected components
- **Steps to reproduce** the vulnerability
- **Suggested fix** if you have one
- **Your contact information** for follow-up

### ⏱️ Response Timeline

- **Initial Response**: Within 48 hours
- **Investigation**: Within 7 days
- **Fix Development**: Within 30 days (depending on severity)
- **Public Disclosure**: After fix is deployed and users have had time to update

### 🛡️ Security Considerations

This application stores trading journal data locally, which includes:

- **Journal entries** in plain text files
- **Uploaded images** (potentially containing sensitive trading information)
- **Local file system access** through the backend server

### 🔐 Current Security Measures

- **Local storage only** - no cloud transmission by default
- **CORS protection** for API endpoints
- **Input validation** for file uploads
- **Path traversal protection** for file access
- **No user authentication** (single-user application)

### 🚨 Known Security Limitations

Please be aware of these current limitations:

1. **No encryption** of journal files at rest
2. **No authentication** - anyone with access to the machine can view journals
3. **Local network exposure** - backend server accessible on local network
4. **File system permissions** - relies on OS-level file permissions

### 🛠️ Security Best Practices for Users

- Run the application only on trusted computers
- Ensure your computer has proper access controls
- Regularly backup your `Notes/` directory
- Be cautious when sharing screenshots or journal content
- Keep your Node.js and npm dependencies updated

### 🔄 Security Updates

Security updates will be:

- **Prioritized** over feature development
- **Clearly marked** in release notes
- **Backward compatible** when possible
- **Documented** in the changelog

### 📞 Contact

For security-related questions or concerns:

- **Security Issues**: [security@email.com]
- **General Questions**: Open a GitHub Discussion
- **Non-Security Bugs**: Use GitHub Issues

---

**Thank you for helping keep the Trading Journal App and our users safe!** 🛡️
