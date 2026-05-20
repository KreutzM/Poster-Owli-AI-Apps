# Bild-Assets und Image-Modelle

Dieses Dokument beschreibt, wie neue Poster-Abbildungen sicher und reproduzierbar vorbereitet werden können.

## Geeignete Einsatzfälle für generierte Bilder

Generierte Bilder eignen sich gut für:

- Konzeptillustrationen,
- Prozessgrafiken,
- einfache Icons,
- visuelle Metaphern,
- Platzhalter für spätere finale Grafiken,
- nicht-datengetriebene Hintergrund- oder Erklärbilder.

Nicht geeignet sind generierte Bilder als Ersatz für:

- echte Messergebnisse,
- wissenschaftliche Datenplots,
- Screenshots von Software, die exakt stimmen müssen,
- Logos oder geschützte Marken ohne Rechteklärung,
- Abbildungen, die eine reale Person, ein reales Produkt oder eine reale Messung exakt wiedergeben sollen.

## Empfohlene Bildanforderungen

Für DIN-A0-Poster sollten Abbildungen:

- kontrastreich sein,
- wenige Details enthalten,
- auch aus 1–2 m Abstand verständlich bleiben,
- möglichst wenig eingebetteten Text enthalten,
- einen ruhigen Hintergrund haben,
- als PNG, PDF oder SVG-zu-PDF eingebunden werden,
- in finaler Druckgröße ausreichend aufgelöst sein.

Für Rastergrafiken sind 150–300 dpi in finaler Druckgröße ein sinnvoller Zielbereich. Für Diagramme und schematische Darstellungen sind Vektorformate vorzuziehen.

## Logos

Die Vorlage enthält institutionelle Header-Defaults:

- `assets/logos/logo_thm.pdf` links,
- `assets/logos/logo_iti.png` rechts,
- `assets/logos/logo_bliz.pdf` optional rechts.

Logos sollten nicht durch Image-Modelle neu generiert oder verändert werden. Nutze freigegebene Originaldateien und dokumentiere die Nutzung in `docs/asset-inventory.md`.

## Beispielauftrag für ein Image-Model

```text
Erzeuge eine klare, wissenschaftlich wirkende Flat-Illustration für ein DIN-A0-Poster.
Thema: ...
Motiv: ...
Stil: minimal, modern, hoher Kontrast, helle Flächen, keine kleinen Details.
Wichtig: ohne Text, ohne Logos, ohne erfundene Zahlen, ohne realistische Personen.
Format: breit, geeignet als zentrale Posterabbildung.
```

## Ablage im Repo

Empfohlene Pfade:

- `assets/figures/main-figure.png` für die Hauptabbildung,
- `assets/figures/process-diagram.pdf` für Prozessgrafiken,
- `assets/logos/` nur für freigegebene Logos,
- `assets/qr/qr-code.png` für den QR-Code.

Jedes externe oder generierte Asset sollte in `docs/asset-inventory.md` dokumentiert werden.

## Einbindung in LaTeX

Die Vorlage nutzt im Standardblock `src/content/05_figure.tex` die zentrale Hauptabbildung. Passe dort Pfad und Bildunterschrift an.

Beispiel:

```tex
\PosterGraphic{assets/figures/main-figure.png}{Kurze, aussagekräftige Bildunterschrift.}{Hauptabbildung}
```

## Prüfung vor Abgabe

Vor Druck oder Veröffentlichung prüfen:

- Ist die Abbildung aus der Distanz lesbar?
- Ist sie fachlich korrekt und nicht irreführend?
- Sind Rechte, Lizenz und Quelle dokumentiert?
- Gibt es keine eingebetteten Tippfehler oder unlesbaren Kleinsttext?
- Passt die Bildunterschrift zur tatsächlichen Aussage der Abbildung?
