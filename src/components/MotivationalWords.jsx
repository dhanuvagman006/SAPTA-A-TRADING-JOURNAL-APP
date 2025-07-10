import { useState, useEffect } from 'react'
import './MotivationalWords.css'

const motivationalQuotes = [
  "📈 Discipline is the bridge between trading goals and accomplishment.",
  "🎯 Every loss teaches you something; every win confirms something.",
  "💪 Consistency beats perfection in the markets every time.",
  "🧠 The market rewards patience, punishes emotion.",
  "⭐ Your journal is your roadmap to profitable trading.",
  "🚀 Great traders are made through deliberate practice.",
  "💎 Cut losses short, let profits run long.",
  "🎪 Markets transfer money from the impatient to the patient.",
  "🏆 Plan your trades, then trade your plans.",
  "🔥 Continuous learning is the key to trading evolution.",
  "🌟 Risk management is your trading superpower.",
  "💰 Focus on being right, not on being rich quickly.",
  "🎮 Trading is a marathon of small, consistent wins.",
  "🎭 Master your emotions to master the markets.",
  "🌈 Every expert was once a beginner who never gave up.",
  "⚡ The best trades often feel uncomfortable at entry.",
  "🎨 Trading is an art that requires scientific discipline.",
  "🔮 Adaptability is the ultimate trading edge.",
  "🎪 When others are fearful, be greedy. When others are greedy, be fearful.",
  "🎯 Your worst trading day can become your best lesson."
]

const MotivationalWords = () => {
  const [currentQuote, setCurrentQuote] = useState(0)

  useEffect(() => {
    const interval = setInterval(() => {
      setCurrentQuote((prev) => (prev + 1) % motivationalQuotes.length)
    }, 8000) // Change quote every 8 seconds

    return () => clearInterval(interval)
  }, [])

  return (
    <div className="motivational-words">
      <div className="quote-container">
        <div className="quote-text">
          {motivationalQuotes[currentQuote]}
        </div>
        <div className="quote-dots">
          {motivationalQuotes.map((_, index) => (
            <span 
              key={index}
              className={`dot ${index === currentQuote ? 'active' : ''}`}
              onClick={() => setCurrentQuote(index)}
            />
          ))}
        </div>
      </div>
    </div>
  )
}

export default MotivationalWords
