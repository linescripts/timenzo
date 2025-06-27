# Timenzo Installers

Official installer repository for Timenzo - AI-powered time tracking and productivity tool.

## 🚀 Quick Install (Latest Version)

```bash
# Download and install the latest version (bypasses GitHub cache)
wget "https://github.com/linescripts/timenzo/raw/HEAD/timenzo-installer.sh?$(date +%s)" -O timenzo-installer.sh && chmod +x timenzo-installer.sh && ./timenzo-installer.sh
```

Or download first and install:

```bash
# Download latest installer (bypasses GitHub cache)
wget "https://github.com/linescripts/timenzo/raw/HEAD/timenzo-installer.sh?$(date +%s)" -O timenzo-installer.sh

# Make executable and run
chmod +x timenzo-installer.sh
./timenzo-installer.sh
```

## 📥 Download Specific Version

```bash
# Download specific version (replace HEAD with desired version)
wget https://github.com/linescripts/timenzo/raw/HEAD/Timenzo-1.0.63-25d6232.sh

# Make executable
chmod +x Timenzo-1.0.63-25d6232.sh

# Run installer
./Timenzo-1.0.63-25d6232.sh
```

Available files in each version branch:
- `timenzo-installer.sh` - Generic filename (same across all versions)
- `Timenzo-1.0.63-25d6232.sh` - Version-specific filename

Browse available versions in the [branches](https://github.com/linescripts/timenzo/branches).

## 🐧 Linux Installation

The installer will:
- Check system requirements
- Install Timenzo to `/opt/timenzo`
- Create desktop shortcuts
- Set up command line access
- Ask if you want to launch Timenzo

### Post-Installation

After installation, you can launch Timenzo by:
- Clicking the Timenzo icon in your applications menu
- Running `timenzo` from the terminal
- Searching for "Timenzo" in your application launcher

**Note:** You may need to log out and back in for the menu entry to appear.

## 🗑️ Uninstallation

**Option 1: Using the uninstaller**
```bash
sudo /opt/timenzo/uninstall.sh
```

**Option 2: Manual removal**
```bash
# Remove installation directory
sudo rm -rf /opt/timenzo

# Remove desktop entry
sudo rm -f /usr/share/applications/timenzo.desktop

# Remove icon
sudo rm -f /usr/share/icons/hicolor/scalable/apps/timenzo.svg

# Remove command line launcher
sudo rm -f /usr/local/bin/timenzo

# Update system databases
sudo update-desktop-database 2>/dev/null || true
sudo gtk-update-icon-cache /usr/share/icons/hicolor 2>/dev/null || true
```

## 🔧 System Requirements

- **OS**: Ubuntu 20.04+ or compatible Linux distribution
- **Dependencies**: GTK 3.0, GLib 2.0
- **Disk Space**: 200MB free space
- **RAM**: 2GB minimum

## 📝 Version History

- **Current Version**: 1.0.63 (latest)
- See all versions: [branches](https://github.com/linescripts/timenzo/branches)

## 🏢 About Timenzo

Timenzo is an AI-powered time tracking solution designed for teams using Odoo ERP. It provides:

- Automatic time tracking
- Smart activity monitoring
- Screenshot capture (optional)
- Seamless Odoo integration
- Productivity analytics

Visit [timenzo.com](https://timenzo.com) for more information.

## 📄 License

Proprietary software. See LICENSE for details.

## 🐛 Support

For issues and support:
- Open an issue on [GitHub](https://github.com/linescripts/timenzo/issues)
- Email: support@linescripts.com

---
© 2024 Linescripts Softwares Pvt. Ltd.