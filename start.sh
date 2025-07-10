#!/bin/bash

# Trading Journal App - Start Script (Linux/macOS)
# This script starts both the backend and frontend servers

echo "🚀 Starting Trading Journal App..."
echo "================================="

# Function to check if a port is in use
check_port() {
    if lsof -Pi :$1 -sTCP:LISTEN -t >/dev/null; then
        return 0
    else
        return 1
    fi
}

# Check if ports are available
if check_port 5000; then
    echo "⚠️  Port 5000 is already in use. Please stop any running backend server."
    exit 1
fi

if check_port 5173; then
    echo "⚠️  Port 5173 is already in use. Please stop any running frontend server."
    exit 1
fi

# Function to cleanup background processes
cleanup() {
    echo ""
    echo "🛑 Stopping servers..."
    if [ ! -z "$BACKEND_PID" ]; then
        kill $BACKEND_PID 2>/dev/null
    fi
    if [ ! -z "$FRONTEND_PID" ]; then
        kill $FRONTEND_PID 2>/dev/null
    fi
    echo "👋 Trading Journal App stopped. Happy trading!"
    exit 0
}

# Set up trap to cleanup on exit
trap cleanup SIGINT SIGTERM

# Start backend server in background
echo "🔧 Starting backend server on port 5000..."
cd server
npm start &
BACKEND_PID=$!
cd ..

# Wait for backend to start
sleep 3

# Start frontend server in background
echo "⚡ Starting frontend server on port 5173..."
npm run dev &
FRONTEND_PID=$!

# Wait for frontend to start
sleep 5

echo ""
echo "✅ Both servers are running!"
echo "📱 Frontend: http://localhost:5173"
echo "🔗 Backend:  http://localhost:5000"
echo ""
echo "📝 Your trading journal is ready!"
echo ""
echo "Press Ctrl+C to stop both servers"

# Keep script running and monitoring
while true; do
    # Check if background processes are still running
    if ! kill -0 $BACKEND_PID 2>/dev/null; then
        echo "❌ Backend server stopped unexpectedly"
        break
    fi
    if ! kill -0 $FRONTEND_PID 2>/dev/null; then
        echo "❌ Frontend server stopped unexpectedly"
        break
    fi
    sleep 2
done

cleanup
