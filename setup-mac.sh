#!/bin/bash
ENV="$(dirname "$0")/version-b-gemini-live/.env"

if [ -f "$ENV" ]; then
    echo ".env existiert bereits."
    exit 0
fi

cp "$(dirname "$0")/version-b-gemini-live/.env.example" "$ENV"
echo "GEMINI_API_KEY=" >> /dev/null

echo ""
echo ".env wurde erstellt. Bitte jetzt den API-Key eintragen:"
echo ""
open -a TextEdit "$ENV"
