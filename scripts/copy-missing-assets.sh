#!/usr/bin/env bash
set -euo pipefail

LANDING_REPO="${1:-../owli-ai-landing}"
POSTER_REPO="${2:-.}"

mkdir -p "$POSTER_REPO/assets/figures" "$POSTER_REPO/assets/qr"

copy_asset() {
  local src="$LANDING_REPO/$1"
  local dst="$POSTER_REPO/$2"
  if [[ ! -f "$src" ]]; then
    echo "Missing source file: $src" >&2
    exit 1
  fi
  cp -f "$src" "$dst"
  echo "copied $2"
}

copy_asset "public/apps/magnify/logo-1024-transparent.webp" "assets/figures/magnify-logo.webp"
copy_asset "public/apps/magnify/screenshot-02.jpg" "assets/figures/magnify-screenshot.jpg"
copy_asset "public/apps/assist/logo-1024-transparent.webp" "assets/figures/assist-logo.webp"
copy_asset "public/apps/assist/screenshot-05.webp" "assets/figures/assist-screenshot.webp"
copy_asset "public/apps/way-buddy/logo-1024-transparent.webp" "assets/figures/way-buddy-logo.webp"
copy_asset "public/apps/way-buddy/screenshot-01.webp" "assets/figures/way-buddy-screenshot.webp"

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
BUNDLE_QR="$(cd "$SCRIPT_DIR/.." && pwd)/assets/qr/sightcity-qr.png"
if [[ -f "$BUNDLE_QR" ]]; then
  cp -f "$BUNDLE_QR" "$POSTER_REPO/assets/qr/sightcity-qr.png"
  echo "copied assets/qr/sightcity-qr.png"
else
  echo "Warning: QR file not found next to script bundle." >&2
fi

echo "Done. Now run: make check && make preview"
