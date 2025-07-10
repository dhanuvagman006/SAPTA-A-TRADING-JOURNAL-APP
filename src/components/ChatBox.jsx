import { useState, useRef, useEffect } from 'react'
import './ChatBox.css'

const ChatBox = ({ onSave, selectedJournal }) => {
  const [content, setContent] = useState('')
  const [isLoading, setIsLoading] = useState(false)
  const textareaRef = useRef(null)

  useEffect(() => {
    if (selectedJournal) {
      setContent(selectedJournal.content)
    }
  }, [selectedJournal])

  const handleSave = async () => {
    if (!content.trim()) return
    
    setIsLoading(true)
    try {
      await onSave(content)
      setContent('')
      alert('Journal saved successfully!')
    } catch (error) {
      alert('Error saving journal')
    } finally {
      setIsLoading(false)
    }
  }

  const handlePaste = async (e) => {
    const items = e.clipboardData.items
    
    for (let item of items) {
      if (item.type.indexOf('image') !== -1) {
        e.preventDefault()
        const file = item.getAsFile()
        
        try {
          const formData = new FormData()
          formData.append('image', file)
          
          const response = await fetch('http://localhost:5000/api/upload', {
            method: 'POST',
            body: formData
          })
          
          const data = await response.json()
          const imageText = `\n[Image: ${data.filename}]\n`
          
          const textarea = textareaRef.current
          const start = textarea.selectionStart
          const end = textarea.selectionEnd
          const newContent = content.substring(0, start) + imageText + content.substring(end)
          
          setContent(newContent)
          
          // Set cursor position after the inserted text
          setTimeout(() => {
            textarea.selectionStart = textarea.selectionEnd = start + imageText.length
            textarea.focus()
          }, 0)
          
        } catch (error) {
          console.error('Error uploading image:', error)
          alert('Error uploading image')
        }
        break
      }
    }
  }

  const handleKeyDown = (e) => {
    if (e.ctrlKey && e.key === 'Enter') {
      handleSave()
    }
  }

  return (
    <div className="chatbox">
      <div className="chatbox-header">
        <h3>✍️ Write Your Trading Journal</h3>
        <p>Record your trades, thoughts, and lessons learned</p>
      </div>
      
      <div className="chatbox-content">
        <textarea
          ref={textareaRef}
          value={content}
          onChange={(e) => setContent(e.target.value)}
          onPaste={handlePaste}
          onKeyDown={handleKeyDown}
          placeholder="Start writing your trading journal entry here...

Tips:
• Describe your trades and market analysis
• Note your emotions and decision-making process
• Paste images directly (screenshots, charts, etc.)
• Press Ctrl+Enter to save quickly

What went well today? What could be improved?"
          className="journal-textarea"
        />
      </div>
      
      <div className="chatbox-footer">
        <div className="toolbar">
          <span className="help-text">
            💡 Tip: You can paste images directly! Press Ctrl+Enter to save.
          </span>
          <button 
            onClick={handleSave}
            disabled={!content.trim() || isLoading}
            className="save-button"
          >
            {isLoading ? '💾 Saving...' : '💾 Save Journal'}
          </button>
        </div>
      </div>
    </div>
  )
}

export default ChatBox
