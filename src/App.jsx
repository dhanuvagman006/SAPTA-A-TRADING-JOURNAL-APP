import { useState, useEffect } from 'react'
import './App.css'
import Sidebar from './components/Sidebar'
import ChatBox from './components/ChatBox'
import MotivationalWords from './components/MotivationalWords'

function App() {
  const [journals, setJournals] = useState([])
  const [selectedJournal, setSelectedJournal] = useState(null)

  useEffect(() => {
    fetchJournals()
  }, [])

  const fetchJournals = async () => {
    try {
      const response = await fetch('http://localhost:5000/api/journals')
      const data = await response.json()
      setJournals(data.journals)
    } catch (error) {
      console.error('Error fetching journals:', error)
    }
  }

  const handleJournalSelect = async (journalName) => {
    try {
      const response = await fetch(`http://localhost:5000/api/journal/${journalName}`)
      const data = await response.json()
      setSelectedJournal({ name: journalName, content: data.content })
    } catch (error) {
      console.error('Error loading journal:', error)
    }
  }

  const handleJournalSave = async (content) => {
    const filename = `journal-${Date.now()}`
    try {
      await fetch('http://localhost:5000/api/journal', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ filename, content })
      })
      fetchJournals() // Refresh the journal list
    } catch (error) {
      console.error('Error saving journal:', error)
    }
  }

  return (
    <div className="app">
      <Sidebar 
        journals={journals} 
        onJournalSelect={handleJournalSelect}
        selectedJournal={selectedJournal}
      />
      <div className="main-content">
        <MotivationalWords />
        <ChatBox 
          onSave={handleJournalSave}
          selectedJournal={selectedJournal}
        />
      </div>
    </div>
  )
}

export default App
