import { useState } from 'react'
import './Sidebar.css'

const Sidebar = ({ journals, onJournalSelect, selectedJournal }) => {
  return (
    <div className="sidebar">
      <div className="sidebar-header">
        <h2>📈 Trading Journal</h2>
        <p>Your trading journey</p>
      </div>
      
      <div className="journal-list">
        <h3>Previous Journals</h3>
        {journals.length === 0 ? (
          <p className="no-journals">No journals yet. Start writing!</p>
        ) : (
          journals.map((journal, index) => (
            <div 
              key={index}
              className={`journal-item ${selectedJournal?.name === journal ? 'active' : ''}`}
              onClick={() => onJournalSelect(journal)}
            >
              <div className="journal-date">
                {new Date(parseInt(journal.split('-')[1])).toLocaleDateString()}
              </div>
              <div className="journal-preview">
                {journal}
              </div>
            </div>
          ))
        )}
      </div>
      
      <div className="sidebar-footer">
        <div className="trading-stats">
          <h4>Quick Stats</h4>
          <div className="stat-item">
            <span>📊 Total Entries: {journals.length}</span>
          </div>
          <div className="stat-item">
            <span>🎯 Keep Going!</span>
          </div>
        </div>
      </div>
    </div>
  )
}

export default Sidebar
