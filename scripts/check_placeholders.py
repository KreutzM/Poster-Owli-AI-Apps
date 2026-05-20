#!/usr/bin/env python3
"""Strict final check: report template placeholders that should be replaced."""

from __future__ import annotations

from pathlib import Path
import re
import sys

ROOT = Path(__file__).resolve().parents[1]
SCAN = [ROOT / "src" / "poster-config.tex", *sorted((ROOT / "src" / "content").glob("*.tex"))]
PATTERNS = [
    re.compile(r"Titel des DIN-A0-Posters"),
    re.compile(r"Kurzer Untertitel"),
    re.compile(r"Vorname Nachname"),
    re.compile(r"kontakt@example\.org"),
    re.compile(r"Beschreibe hier"),
    re.compile(r"Formuliere"),
    re.compile(r"Hauptkennzahl"),
    re.compile(r"main-figure\.pdf"),
]


def main() -> int:
    findings: list[str] = []
    for path in SCAN:
        text = path.read_text(encoding="utf-8", errors="replace")
        for line_no, line in enumerate(text.splitlines(), 1):
            if any(pattern.search(line) for pattern in PATTERNS):
                findings.append(f"{path.relative_to(ROOT)}:{line_no}: {line.strip()}")

    if findings:
        print("Template placeholders still present:")
        for item in findings:
            print(f"  {item}")
        return 1

    print("OK: no template placeholders detected")
    return 0


if __name__ == "__main__":
    sys.exit(main())
