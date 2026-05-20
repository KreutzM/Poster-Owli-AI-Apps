param(
  [string]$LandingRepo = "..\owli-ai-landing",
  [string]$PosterRepo = "."
)

$ErrorActionPreference = "Stop"

$targets = @(
  @{ Source = "public/apps/magnify/logo-1024-transparent.webp"; Target = "assets/figures/magnify-logo.webp" },
  @{ Source = "public/apps/magnify/screenshot-02.jpg"; Target = "assets/figures/magnify-screenshot.jpg" },
  @{ Source = "public/apps/assist/logo-1024-transparent.webp"; Target = "assets/figures/assist-logo.webp" },
  @{ Source = "public/apps/assist/screenshot-05.webp"; Target = "assets/figures/assist-screenshot.webp" },
  @{ Source = "public/apps/way-buddy/logo-1024-transparent.webp"; Target = "assets/figures/way-buddy-logo.webp" },
  @{ Source = "public/apps/way-buddy/screenshot-01.webp"; Target = "assets/figures/way-buddy-screenshot.webp" }
)

New-Item -ItemType Directory -Force -Path (Join-Path $PosterRepo "assets/figures") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $PosterRepo "assets/qr") | Out-Null

foreach ($item in $targets) {
  $src = Join-Path $LandingRepo $item.Source
  $dst = Join-Path $PosterRepo $item.Target
  if (!(Test-Path $src)) {
    throw "Missing source file: $src"
  }
  Copy-Item -Force $src $dst
  Write-Host "copied $($item.Target)"
}

# Copy QR code from this bundle when the script is executed from an extracted ZIP root or poster repo with scripts/ present.
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$bundleQr = Join-Path (Split-Path -Parent $scriptDir) "assets/qr/sightcity-qr.png"
if (Test-Path $bundleQr) {
  Copy-Item -Force $bundleQr (Join-Path $PosterRepo "assets/qr/sightcity-qr.png")
  Write-Host "copied assets/qr/sightcity-qr.png"
} else {
  Write-Warning "QR file not found next to script bundle. Keep existing PosterRepo/assets/qr/sightcity-qr.png or generate it separately."
}

Write-Host "Done. Now run: make check; make preview"
