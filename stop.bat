@echo off
REM SillyTavern Stop Script

echo.
echo Stopping SillyTavern...
echo.

REM Kill processes using port 8000
for /f "tokens=5" %%a in ('netstat -aon ^| find ":8000"') do (
    taskkill /PID %%a /F 2>nul
)

echo [+] SillyTavern stopped
pause
