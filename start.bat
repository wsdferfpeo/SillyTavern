@echo off
REM SillyTavern Start Script

echo.
echo ========================================
echo   Starting SillyTavern
echo ========================================
echo.

REM Check if node_modules exists
if not exist "node_modules" (
    echo [!] Dependencies not installed!
    echo Please run: .\setup.bat
    pause
    exit /b 1
)

echo [*] Starting SillyTavern server...
echo [+] Server running at: http://localhost:8000
echo.
echo Press Ctrl+C to stop the server
echo.

npm run start
