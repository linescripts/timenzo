#!/bin/bash
# Download and run the latest Timenzo for Linux

echo "🔍 Finding latest Linux release..."

# Check if curl is available, otherwise use wget
if command -v curl &> /dev/null; then
    LATEST_URL=$(curl -s https://api.github.com/repos/linescripts/timenzo/releases | \
        grep -E '"browser_download_url".*linux.*\.sh"' | \
        head -1 | cut -d'"' -f4)
elif command -v wget &> /dev/null; then
    LATEST_URL=$(wget -qO- https://api.github.com/repos/linescripts/timenzo/releases | \
        grep -E '"browser_download_url".*linux.*\.sh"' | \
        head -1 | cut -d'"' -f4)
else
    echo "❌ Error: Neither curl nor wget is installed"
    echo "Please install curl or wget:"
    echo "  sudo apt-get install curl"
    echo "  or"
    echo "  sudo apt-get install wget"
    exit 1
fi

if [ -z "$LATEST_URL" ]; then
    echo "❌ Error: Could not find latest Linux release"
    exit 1
fi

echo "📥 Downloading from: $LATEST_URL"

# Download using available tool
if command -v curl &> /dev/null; then
    curl -L "$LATEST_URL" -o timenzo-installer.sh
elif command -v wget &> /dev/null; then
    wget -q "$LATEST_URL" -O timenzo-installer.sh
fi

chmod +x timenzo-installer.sh
echo "🚀 Running installer..."
./timenzo-installer.sh "$@"
rm -f timenzo-installer.sh

# Clean up the download script itself after a small delay
echo "🧹 Cleaning up..."
(sleep 1 && rm -f "$0") &