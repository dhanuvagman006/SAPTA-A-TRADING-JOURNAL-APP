@echo off
title Trading Journal App

echo.
echo 🚀 Starting Trading Journal App...
echo =================================
echo.

REM Check if Node.js is installed
where node >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo ❌ Node.js is not installed or not in PATH
    echo Please install Node.js from https://nodejs.org/
    pause
    exit /b 1
)

REM Check if npm is installed
where npm >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo ❌ npm is not installed or not in PATH
    pause
    exit /b 1
)

echo 🔧 Starting backend server on port 5000...
start "Backend Server" cmd /k "cd /d %~dp0server && npm start"

echo ⏳ Waiting for backend to initialize...
timeout /t 3 /nobreak >nul

echo ⚡ Starting frontend server on port 5173...
start "Frontend Server" cmd /k "cd /d %~dp0 && npm run dev"

echo ⏳ Waiting for frontend to initialize...
timeout /t 3 /nobreak >nul

echo.
echo ✅ Both servers are starting up!
echo 📱 Frontend: http://localhost:5173
echo 🔗 Backend:  http://localhost:5000
echo.
echo 📝 Your trading journal is ready!
echo.
echo 💡 Tips:
echo    - Both servers will open in separate windows
echo    - Close the windows or press Ctrl+C in them to stop
echo    - The frontend will automatically open in your browser
echo.

REM Try to open the frontend in the default browser
timeout /t 5 /nobreak >nul
start http://localhost:5173

echo 🎉 Happy trading! Press any key to close this window.
pause >nul
