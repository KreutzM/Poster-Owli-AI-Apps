#!/usr/bin/env python3
"""Lightweight repository-structure checks for the poster template."""

from __future__ import annotations

from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]
REQUIRED = [
    "main.tex",
    "src/preamble.tex",
    "src/poster-config.tex",
    "src/poster-theme.tex",
    "src/content/00_header.tex",
    "src/content/08_footer.tex",
    "README.md",
    "AGENTS.md",
    "Makefile",
    "latexmkrc",
    "docs/layout-guide.md",
    "docs/content-checklist.md",
    "docs/accessibility.md",
    "docs/asset-inventory.md",
    "docs/codex-workflow.md",
    "docs/image-assets.md",
    "assets/logos/logo_thm.pdf",
    "assets/logos/logo_iti.png",
    "assets/logos/logo_bliz.pdf",
]
FORBIDDEN_DIRS = ["build"]


def main() -> int:
    missing = [path for path in REQUIRED if not (ROOT / path).exists()]
    if missing:
        print("Missing required files:")
        for item in missing:
            print(f"  {item}")
        return 1

    forbidden_present = [path for path in FORBIDDEN_DIRS if (ROOT / path).exists()]
    if forbidden_present:
        print("Generated directories are present; run 'make distclean' before packaging:")
        for item in forbidden_present:
            print(f"  {item}/")
        return 1

    print("OK: repository structure looks clean")
    return 0


if __name__ == "__main__":
    sys.exit(main())
