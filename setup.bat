@echo off
REM SillyTavern Setup Script for Windows
REM Automatically checks and installs dependencies

echo.
echo ========================================
echo   SillyTavern Setup Script
echo ========================================
echo.

REM Check if Node.js is installed
echo [*] Checking Node.js installation...
node --version >nul 2>&1
if errorlevel 1 (
    echo [!] Node.js is NOT installed!
    echo.
    echo Please install Node.js 18 LTS from: https://nodejs.org/
    echo After installation, restart your command line and run this script again.
    echo.
    pause
    exit /b 1
) else (
    for /f "tokens=*" %%i in ('node --version') do set NODE_VERSION=%%i
    echo [+] Node.js installed: !NODE_VERSION!
)

REM Check if npm is installed
echo [*] Checking npm installation...
npm --version >nul 2>&1
if errorlevel 1 (
    echo [!] npm is NOT installed!
    echo Please reinstall Node.js with npm included.
    pause
    exit /b 1
) else (
    for /f "tokens=*" %%i in ('npm --version') do set NPM_VERSION=%%i
    echo [+] npm installed: v!NPM_VERSION!
)

REM Check if package.json exists
echo [*] Checking package.json...
if not exist "package.json" (
    echo [!] package.json not found!
    echo Please ensure you are in the SillyTavern directory.
    pause
    exit /b 1
) else (
    echo [+] package.json found
)

REM Install dependencies
echo.
echo [*] Installing npm dependencies...
echo This may take a few minutes...
echo.
npm install

if errorlevel 1 (
    echo [!] npm install failed!
    echo Please check your internet connection and try again.
    pause
    exit /b 1
) else (
    echo [+] Dependencies installed successfully!
)

REM Run dependency checker
echo.
echo [*] Running dependency verification...
node check-deps.js

echo.
echo ========================================
echo   Setup Complete!
echo ========================================
echo.
echo Next steps:
echo 1. Run: .\start.bat
echo 2. Open: http://localhost:8000
echo.
pause
