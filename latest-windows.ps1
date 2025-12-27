# Timenzo Windows Installer Bootstrap Script
# Downloads and runs the latest Timenzo installer for Windows

$ErrorActionPreference = "Stop"

Write-Host "Finding latest Windows release..." -ForegroundColor Cyan

try {
    # Query GitHub API for latest release
    $releases = Invoke-RestMethod -Uri "https://api.github.com/repos/linescripts/timenzo/releases" -Headers @{Accept = "application/vnd.github.v3+json"}

    # Find the first Windows release
    $windowsRelease = $releases | Where-Object { $_.tag_name -like "*-windows" } | Select-Object -First 1

    if (-not $windowsRelease) {
        throw "No Windows release found"
    }

    # Find the installer asset
    $installerAsset = $windowsRelease.assets | Where-Object { $_.name -like "*-setup.exe" } | Select-Object -First 1

    if (-not $installerAsset) {
        throw "No installer found in release"
    }

    $downloadUrl = $installerAsset.browser_download_url
    $fileName = $installerAsset.name

    Write-Host "Downloading: $fileName" -ForegroundColor Green
    Write-Host "From: $downloadUrl" -ForegroundColor Gray

    # Download installer
    $tempPath = Join-Path $env:TEMP $fileName
    Invoke-WebRequest -Uri $downloadUrl -OutFile $tempPath -UseBasicParsing

    Write-Host "Running installer..." -ForegroundColor Green

    # Run installer
    Start-Process -FilePath $tempPath -Wait

    # Cleanup
    Remove-Item $tempPath -Force -ErrorAction SilentlyContinue

    Write-Host "Installation complete!" -ForegroundColor Green
}
catch {
    Write-Host "Error: $_" -ForegroundColor Red
    Write-Host "Please download manually from: https://github.com/linescripts/timenzo/releases" -ForegroundColor Yellow
    exit 1
}
