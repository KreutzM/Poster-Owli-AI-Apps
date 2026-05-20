#!/usr/bin/env python3
"""Prepare poster assets for pdfLaTeX.

pdfLaTeX cannot include WebP files directly. The website assets are kept in
`assets/figures/` as their original WebP/JPG files, while this script converts
WebP files to PNG files under `build/assets/figures/` before LaTeX runs.
"""

from __future__ import annotations

from pathlib import Path
import shutil
import sys

ROOT = Path(__file__).resolve().parents[1]
SOURCE_DIR = ROOT / "assets" / "figures"
BUILD_DIR = ROOT / "build" / "assets" / "figures"

WEBP_TARGETS = [
    ("magnify-logo.webp", "magnify-logo.png"),
    ("assist-logo.webp", "assist-logo.png"),
    ("assist-screenshot.webp", "assist-screenshot.png"),
    ("way-buddy-logo.webp", "way-buddy-logo.png"),
    ("way-buddy-screenshot.webp", "way-buddy-screenshot.png"),
]
COPY_TARGETS = [
    ("magnify-screenshot.jpg", "magnify-screenshot.jpg"),
]


def ensure_pillow():
    try:
        from PIL import Image  # type: ignore
    except ImportError as exc:
        raise SystemExit(
            "ERROR: Pillow is required for WebP -> PNG conversion. "
            "Install it with `python -m pip install Pillow` or your OS package "
            "manager, e.g. `sudo apt-get install python3-pil`."
        ) from exc
    return Image


def main() -> int:
    BUILD_DIR.mkdir(parents=True, exist_ok=True)
    Image = ensure_pillow()

    missing: list[str] = []
    for source_name, _ in WEBP_TARGETS + COPY_TARGETS:
        if not (SOURCE_DIR / source_name).is_file():
            missing.append(str(SOURCE_DIR / source_name))

    if missing:
        print("ERROR: Missing poster assets:", file=sys.stderr)
        for path in missing:
            print(f"  {path}", file=sys.stderr)
        return 1

    for source_name, target_name in WEBP_TARGETS:
        source = SOURCE_DIR / source_name
        target = BUILD_DIR / target_name
        with Image.open(source) as image:
            # Preserve transparency for logos; screenshots are RGB/RGBA depending on source.
            image.save(target, format="PNG")
        print(f"prepared {target.relative_to(ROOT)}")

    for source_name, target_name in COPY_TARGETS:
        source = SOURCE_DIR / source_name
        target = BUILD_DIR / target_name
        shutil.copy2(source, target)
        print(f"prepared {target.relative_to(ROOT)}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
