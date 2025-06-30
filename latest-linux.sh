#!/bin/bash
# Download and run the latest Timenzo for Linux

echo "🔍 Finding latest Linux release..."
LATEST_URL=$(curl -s https://api.github.com/repos/linescripts/timenzo/releases | \
    grep -E '"browser_download_url".*linux.*\.sh"' | \
    head -1 | cut -d'"' -f4)

if [ -z "$LATEST_URL" ]; then
    echo "❌ Error: Could not find latest Linux release"
    exit 1
fi

echo "📥 Downloading from: $LATEST_URL"
curl -L "$LATEST_URL" -o timenzo-installer.sh
chmod +x timenzo-installer.sh
echo "🚀 Running installer..."
./timenzo-installer.sh "$@"
rm -f timenzo-installer.sh

# Clean up the download script itself
rm -f "$0"
