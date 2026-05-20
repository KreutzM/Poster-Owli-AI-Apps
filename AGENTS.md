# AGENTS.md

Hinweise für Codex CLI oder andere Coding-Agenten in diesem Poster-Repo.

## Ziel

Dieses Repository enthält eine neutrale, leere DIN-A0-LaTeX-Poster-Vorlage. Inhaltliche Änderungen sollen in `src/content/` erfolgen, zentrale Metadaten in `src/poster-config.tex`, Layout-Änderungen in `src/poster-theme.tex`.

## Build

```bash
make check
make preview
make visual-check
```

`make check` muss vor Abschluss erfolgreich sein. Danach `build/main.pdf` und vor allem `build/poster-preview.png` visuell prüfen.

## Regeln

- Keine generierten Dateien aus `build/` committen.
- Keine Logos oder Bilder ohne Rechteprüfung ergänzen.
- Keine numerischen Claims erfinden.
- Platzhalter dürfen in der leeren Vorlage existieren; vor finaler Abgabe `make final-check` nutzen.
- Sprache standardmäßig Deutsch, außer die Nutzer:innen wünschen Englisch.
- Abbildungen sollen lesbar, kontrastreich und ohne unnötigen Text sein.

## Poster workflow for Codex

When creating a new poster:

1. Edit `src/poster-config.tex` first.
2. Replace content block by block in `src/content/`.
3. Keep poster text short enough to be read from 1--2 m distance.
4. Prefer one clear central figure over many small figures.
5. Use generated images only for conceptual illustrations, icons, process diagrams, or placeholders. Do not invent scientific result plots.
6. Run `make check`.
7. Run `make preview` or `make visual-check`.
8. Review `build/poster-preview.png` visually before finalizing.
9. Optimize title hierarchy, whitespace, box balance, text density, and figure size.
10. Run `make final-check` only for finished non-template posters.

## Visuelle Bewertung

Wenn du Zugriff auf Bild-Input hast, nutze die PNG-Vorschau:

```bash
codex -i build/poster-preview.png "Review this DIN-A0 poster visually. Check hierarchy, whitespace, text density, column balance, figure size, print readability, and concrete LaTeX improvements."
```

Bewerte insbesondere:

- Ist die Kernaussage innerhalb von 5 Sekunden erkennbar?
- Sind Titel, Take-away, Blocküberschriften und Fließtext klar hierarchisiert?
- Gibt es zu viel Text oder zu kleine Schrift?
- Sind die Spalten optisch ausgewogen?
- Ist die Hauptabbildung groß genug und verständlich?
- Sind Kontakt, QR-Code und Eventinformationen gut auffindbar?

## Typische Änderungsreihenfolge

1. `src/poster-config.tex` anpassen.
2. Einen Inhaltsblock in `src/content/` ersetzen.
3. Falls nötig Assets in `assets/` ergänzen.
4. `make check` ausführen.
5. `make preview` ausführen.
6. `build/poster-preview.png` visuell prüfen.
