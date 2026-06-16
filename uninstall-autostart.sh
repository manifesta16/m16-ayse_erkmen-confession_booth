#!/bin/bash
# Deaktiviert den Autostart der Confession Booth.

PLIST="$HOME/Library/LaunchAgents/com.confessionbooth.plist"
launchctl unload "$PLIST" 2>/dev/null
rm -f "$PLIST"
echo "✓ Autostart deaktiviert."
