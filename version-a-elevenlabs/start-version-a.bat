@echo off
cd /d "%~dp0"

if not exist ".env" (
    echo .env fehlt. Bitte .env.example kopieren und ausfullen:
    echo   copy .env.example .env
    pause
    exit /b 1
)

if not exist "node_modules" (
    echo Installiere Abhaengigkeiten...
    npm install
)

echo.
echo Confession Booth Version A laeuft auf http://localhost:3000
echo Strg+C zum Beenden.
echo.
start "" http://localhost:3000
node server.js
pause
