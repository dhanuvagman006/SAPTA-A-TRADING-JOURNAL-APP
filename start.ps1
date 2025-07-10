#!/usr/bin/env pwsh

# Trading Journal App - Start Script
# This script starts both the backend and frontend servers

Write-Host "🚀 Starting Trading Journal App..." -ForegroundColor Cyan
Write-Host "=================================" -ForegroundColor Cyan

# Get current directory
$currentDir = Get-Location

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

# Check if ports are available
if (Test-Port 5000) {
    Write-Host "⚠️  Port 5000 is already in use. Please stop any running backend server." -ForegroundColor Yellow
    exit 1
}

if (Test-Port 5173) {
    Write-Host "⚠️  Port 5173 is already in use. Please stop any running frontend server." -ForegroundColor Yellow
    exit 1
}

# Start backend server in background
Write-Host "🔧 Starting backend server on port 5000..." -ForegroundColor Green
$backendJob = Start-Job -ScriptBlock {
    param($dir)
    Set-Location $dir
    Set-Location .\server
    npm start
} -ArgumentList $currentDir

# Wait a moment for backend to start
Start-Sleep -Seconds 3

# Start frontend server in background
Write-Host "⚡ Starting frontend server on port 5173..." -ForegroundColor Green
$frontendJob = Start-Job -ScriptBlock {
    param($dir)
    Set-Location $dir
    npm run dev
} -ArgumentList $currentDir

# Wait a moment for frontend to start
Start-Sleep -Seconds 5

Write-Host ""
Write-Host "✅ Both servers are starting up!" -ForegroundColor Green
Write-Host "📱 Frontend: http://localhost:5173" -ForegroundColor Cyan
Write-Host "🔗 Backend:  http://localhost:5000" -ForegroundColor Cyan
Write-Host ""
Write-Host "📝 Your trading journal is ready!" -ForegroundColor Magenta
Write-Host ""
Write-Host "💡 Tip: The app will open automatically in your browser shortly!" -ForegroundColor Blue
Write-Host "Press Ctrl+C to stop both servers" -ForegroundColor Yellow

# Try to open browser after a short delay
Start-Job -ScriptBlock {
    Start-Sleep -Seconds 8
    Start-Process "http://localhost:5173"
} | Out-Null

# Monitor jobs and keep script running
try {
    while ($true) {
        # Check if jobs are still running
        if ($backendJob.State -eq "Failed") {
            Write-Host "❌ Backend server failed!" -ForegroundColor Red
            Write-Host "Backend output:" -ForegroundColor Yellow
            Receive-Job -Job $backendJob
            break
        }
        if ($frontendJob.State -eq "Failed") {
            Write-Host "❌ Frontend server failed!" -ForegroundColor Red
            Write-Host "Frontend output:" -ForegroundColor Yellow
            Receive-Job -Job $frontendJob
            break
        }
        
        # Show some output from jobs periodically
        $backendOutput = Receive-Job -Job $backendJob -Keep
        $frontendOutput = Receive-Job -Job $frontendJob -Keep
        
        Start-Sleep -Seconds 2
    }
} finally {
    # Cleanup: Stop both jobs when script exits
    Write-Host ""
    Write-Host "🛑 Stopping servers..." -ForegroundColor Yellow
    
    if ($backendJob) {
        Stop-Job -Job $backendJob -ErrorAction SilentlyContinue
        Remove-Job -Job $backendJob -Force -ErrorAction SilentlyContinue
    }
    
    if ($frontendJob) {
        Stop-Job -Job $frontendJob -ErrorAction SilentlyContinue
        Remove-Job -Job $frontendJob -Force -ErrorAction SilentlyContinue
    }
    
    # Clean up any remaining jobs
    Get-Job | Where-Object { $_.Name -like "Job*" } | Remove-Job -Force -ErrorAction SilentlyContinue
    
    Write-Host "👋 Trading Journal App stopped. Happy trading!" -ForegroundColor Cyan
}
