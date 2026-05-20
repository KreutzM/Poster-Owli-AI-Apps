# LaTeX DIN-A0 Poster Template

Gut dokumentierte LaTeX-Vorlage für wissenschaftliche DIN-A0-Poster im Hochformat. Die Vorlage ist für THM-/ITI-/BLiZ-Poster vorbereitet, bleibt aber so aufgebaut, dass Titel, Inhalte, Farben, Logos und Assets zentral angepasst werden können.

## Schnellstart

```bash
make pdf
```

Das PDF liegt danach unter:

```text
build/main.pdf
```

Für eine PNG-Vorschau:

```bash
make preview
```

Für eine Vorschau plus Codex-Hinweis zur visuellen Prüfung:

```bash
make visual-check
```

## Struktur

| Pfad | Zweck |
|---|---|
| `main.tex` | Root-Datei und Poster-Raster |
| `src/preamble.tex` | LaTeX-Pakete, A0-Format, Caption-Setup |
| `src/poster-config.tex` | Titel, Autor:innen, Logos, Farben, Kontakt, Abstände, Footer |
| `src/poster-theme.tex` | Boxen, Makros, Platzhalter, typografisches Design |
| `src/content/` | Inhaltliche Posterblöcke |
| `assets/logos/` | THM-/ITI-/BLiZ-Logos und optionale weitere Logos |
| `assets/figures/` | optionale Abbildungen |
| `assets/qr/` | optionaler QR-Code |
| `docs/` | Layout-, Inhalts-, Codex- und Druckhinweise |
| `scripts/` | einfache Qualitätschecks |

## Default-Layout

- DIN A0 Hochformat.
- 30 mm Außenrand als ruhiger, drucksicherer Standard.
- THM-Logo links oben.
- ITI-Logo rechts oben.
- BLiZ-Logo rechts oben per Schalter aktivierbar.
- Zentrale Take-away-Zeile unter dem Header.
- Drei gleich breite Inhaltsspalten.
- Dunkle Footer-Bar für QR-Code, Kontakt, Projekt, DOI, Lizenz oder Förderhinweis.

## Editier-Reihenfolge

1. `src/poster-config.tex`: Titel, Autor:innen, Event, Kontakt, Farben, Logos und Footer anpassen.
2. `src/content/*.tex`: Inhalte blockweise ersetzen.
3. `assets/`: Abbildungen und QR-Code ergänzen; Logo-Defaults nur bei Bedarf ändern.
4. `src/poster-theme.tex`: Nur bei Bedarf Layout, Boxen und Abstände ändern.
5. `make check` ausführen.
6. `make preview` ausführen und `build/poster-preview.png` visuell prüfen.

## Logo-Konfiguration

Standardmäßig wird links `assets/logos/logo_thm.pdf` und rechts `assets/logos/logo_iti.png` verwendet.

Für BLiZ-Poster kann in `src/poster-config.tex` der rechte Header auf BLiZ umgestellt werden:

```tex
\PosterUseBlizLogotrue
```

## Empfohlenes Poster-Prinzip

Ein A0-Poster wird meist aus 1–2 m Entfernung gelesen. Deshalb sollte es eine klare visuelle Hierarchie haben:

- eine zentrale Botschaft direkt unter dem Titel,
- kurze Blöcke statt langer Fließtexte,
- wenige, große Abbildungen statt vieler kleiner Screenshots,
- messbare Kernaussagen als große Kennzahlen,
- QR-Code und Kontakt in der Footer-Bar,
- sichere Außenränder für Druck, Rahmen und Posterleisten.

## Platzhalter und finale Prüfung

Die Vorlage baut auch ohne optionale externe Bilder. Fehlende Logos, QR-Codes und Abbildungen werden als Platzhalter gerendert. Vor der Abgabe kannst du prüfen, ob noch Platzhaltertexte enthalten sind:

```bash
make final-check
```

`make final-check` ist bewusst strenger als `make check` und für fertige Poster gedacht, nicht für die leere Vorlage.

## Voraussetzungen

Unter Debian/Ubuntu sind diese Pakete typischerweise ausreichend:

```bash
sudo apt-get update
sudo apt-get install latexmk texlive-latex-extra texlive-lang-german texlive-fonts-recommended lmodern python3 poppler-utils
```

`poppler-utils` wird nur für `make preview` benötigt.
