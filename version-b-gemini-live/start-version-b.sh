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
echo "Confession Booth Version B läuft auf http://localhost:3001"
echo "Strg+C zum Beenden."
echo ""
# Warten bis der Server bereit ist, dann Browser öffnen
(sleep 2 && if open -Ra "Google Chrome" 2>/dev/null; then
  open -a "Google Chrome" --args --kiosk http://localhost:3001
else
  open http://localhost:3001
fi) &
node server.js
