#!/bin/bash
# Richtet den Autostart der Confession Booth (Version B) ein.
# Einmalig ausführen: bash install-autostart.sh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PLIST="$HOME/Library/LaunchAgents/com.confessionbooth.plist"

cat > "$PLIST" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.confessionbooth</string>
    <key>ProgramArguments</key>
    <array>
        <string>/bin/bash</string>
        <string>$SCRIPT_DIR/version-b-gemini-live/start-version-b.sh</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
    <key>StandardOutPath</key>
    <string>/tmp/confessionbooth.log</string>
    <key>StandardErrorPath</key>
    <string>/tmp/confessionbooth.error.log</string>
</dict>
</plist>
EOF

launchctl load "$PLIST"
echo "✓ Autostart eingerichtet. Die App startet ab jetzt automatisch beim Login."
echo "  Zum Deaktivieren: bash uninstall-autostart.sh"
