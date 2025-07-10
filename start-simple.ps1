#!/usr/bin/env pwsh

# Trading Journal App - Simple Start Script
# This script starts both servers in separate windows

Write-Host "🚀 Starting Trading Journal App..." -ForegroundColor Cyan
Write-Host "=================================" -ForegroundColor Cyan

# Function to check if a port is in use
function Test-Port {
    param([int]$Port)
    try {
        $connection = New-Object System.Net.Sockets.TcpClient
        $connection.Connect("localhost", $Port)
        $connection.Close()
        return $true
    } catch {
        return $false
    }
}

# Check if Node.js is available
try {
    $nodeVersion = node --version
    Write-Host "✅ Node.js version: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Node.js is not installed or not in PATH" -ForegroundColor Red
    Write-Host "Please install Node.js from https://nodejs.org/" -ForegroundColor Yellow
    exit 1
}

# Check if ports are available
if (Test-Port 5000) {
    Write-Host "⚠️  Port 5000 is already in use. Please stop any running backend server." -ForegroundColor Yellow
    exit 1
}

if (Test-Port 5173) {
    Write-Host "⚠️  Port 5173 is already in use. Please stop any running frontend server." -ForegroundColor Yellow
    exit 1
}

# Get current directory
$currentDir = Get-Location

# Start backend server in new window
Write-Host "🔧 Starting backend server on port 5000..." -ForegroundColor Green
$backendPath = Join-Path $currentDir "server"
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$backendPath'; Write-Host '🔧 Backend Server Starting...' -ForegroundColor Green; npm start"

# Wait for backend to start
Write-Host "⏳ Waiting for backend to initialize..." -ForegroundColor Yellow
Start-Sleep -Seconds 5

# Start frontend server in new window
Write-Host "⚡ Starting frontend server on port 5173..." -ForegroundColor Green
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$currentDir'; Write-Host '⚡ Frontend Server Starting...' -ForegroundColor Blue; npm run dev"

# Wait for frontend to start
Write-Host "⏳ Waiting for frontend to initialize..." -ForegroundColor Yellow
Start-Sleep -Seconds 8

Write-Host ""
Write-Host "✅ Both servers are starting up!" -ForegroundColor Green
Write-Host "📱 Frontend: http://localhost:5173" -ForegroundColor Cyan
Write-Host "🔗 Backend:  http://localhost:5000" -ForegroundColor Cyan
Write-Host ""
Write-Host "📝 Your trading journal is ready!" -ForegroundColor Magenta
Write-Host ""
Write-Host "💡 Tips:" -ForegroundColor Blue
Write-Host "   - Both servers are running in separate windows" -ForegroundColor White
Write-Host "   - Close the windows or press Ctrl+C in them to stop servers" -ForegroundColor White
Write-Host "   - The frontend will open in your browser automatically" -ForegroundColor White
Write-Host ""

# Try to open the browser
try {
    Start-Process "http://localhost:5173"
    Write-Host "🌐 Opening browser to http://localhost:5173" -ForegroundColor Cyan
} catch {
    Write-Host "⚠️  Could not auto-open browser. Please manually navigate to http://localhost:5173" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "🎉 Setup complete! Happy trading!" -ForegroundColor Magenta
Write-Host "Press any key to close this window..." -ForegroundColor Gray
[Console]::ReadKey() | Out-Null
