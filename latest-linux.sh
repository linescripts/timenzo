#!/bin/bash
# Download and run the latest Timenzo for Linux

echo "🔍 Finding latest Linux release..."

# Get the v1.0.4-linux release specifically (latest stable)
LATEST_URL="https://github.com/linescripts/timenzo/releases/download/v1.0.4-linux/Timenzo-1.0.4-linux-883c169.sh"
VERSION="v1.0.4-linux"

echo "📦 Version: $VERSION"
echo "📥 Downloading..."
curl -L "$LATEST_URL" -o timenzo-installer.sh

if [ ! -f "timenzo-installer.sh" ]; then
    echo "❌ Error: Download failed"
    exit 1
fi

chmod +x timenzo-installer.sh
echo "🚀 Running installer..."
./timenzo-installer.sh "$@"
rm -f timenzo-installer.sh