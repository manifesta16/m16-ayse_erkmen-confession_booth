#!/bin/bash
cd "$(dirname "$0")"

if [ ! -f ".env" ]; then
    echo ".env fehlt. Bitte .env.example kopieren und ausfüllen:"
    echo "  cp .env.example .env"
    exit 1
fi

echo "Prüfe auf Updates..."
git -C "$(dirname "$0")/.." pull --ff-only 2>/dev/null && echo "Aktuell." || echo "Kein Update (kein Internet oder keine Änderungen)."

if [ ! -d "node_modules" ]; then
    echo "Installiere Abhängigkeiten..."
    npm install
fi

echo ""
echo "Confession Booth Version B läuft auf http://localhost:3000"
echo "Strg+C zum Beenden."
echo ""
# Warten bis der Server bereit ist, dann Browser öffnen
(sleep 5 && CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
if [ -f "$CHROME" ]; then
  "$CHROME" --app=http://localhost:3000 --start-fullscreen &
else
  open http://localhost:3000
fi) &
node server.js
