# Branch Management Guide

## Branch Structure

- **main** - Contains README and documentation only
- **v1.0.11** - Contains installer for version 1.0.11
- **v1.0.12** - Contains installer for version 1.0.12
- etc...

## Workflow

1. **Main branch** contains only documentation
2. **Each version** gets its own branch with the installer file
3. **Users** can see all versions by browsing branches

## Adding a New Version

1. Build the installer in your development repo:
   ```bash
   cd ~/Desktop/odoo18/custom/timenzo/timenzo
   ./create-installer.sh
   ```

2. Create a new version branch:
   ```bash
   cd ../timenzo-installers
   git checkout -b v1.0.12
   ```

3. Copy the installer:
   ```bash
   cp ../timenzo/Timenzo-1.0.12-abc123.sh .
   ```

4. Commit and push:
   ```bash
   git add Timenzo-*.sh
   git commit -m "Version 1.0.12"
   git push origin v1.0.12
   ```

## Benefits

- Simple version management
- Users can easily see which versions are available
- Direct download links work forever
- Example: `https://github.com/linescripts/timenzo/raw/v1.0.11/Timenzo-1.0.11-926947a.sh`