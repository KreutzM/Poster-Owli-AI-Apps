# Codex-Workflow für DIN-A0-Poster

Diese Vorlage ist so aufgebaut, dass Codex CLI ein Poster schnell textlich, strukturell und visuell iterieren kann.

## Grundprinzip

Codex soll nicht nur LaTeX-Code bearbeiten, sondern nach größeren Schritten das gerenderte Poster prüfen.

Empfohlene Reihenfolge:

1. Inhalt und Metadaten anpassen.
2. `make check` ausführen.
3. `make preview` ausführen.
4. Die erzeugte Datei `build/poster-preview.png` visuell prüfen.
5. Layout, Textdichte und Abbildungsgröße iterativ verbessern.

Die PNG-Vorschau ist der wichtigste Artefakt für visuelle Bewertung, weil Layout, Lesbarkeit und Abstände daran besser beurteilt werden können als am LaTeX-Code allein.

## Neues Poster aus einem Thema erstellen

Beispielauftrag an Codex:

```text
Erstelle aus dieser Vorlage ein DIN-A0-Poster zum Thema "...".
Zielgruppe: ...
Event: ...
Kernaussage: ...

Arbeite in dieser Reihenfolge:
1. Passe src/poster-config.tex an.
2. Ersetze die Inhalte in src/content/*.tex.
3. Nutze kurze, postergeeignete Texte.
4. Verwende eine große zentrale Abbildung oder einen Platzhalter.
5. Führe make check aus.
6. Führe make preview aus.
7. Bewerte build/poster-preview.png visuell und optimiere Layout und Textdichte.
```

## Institutionelle Defaults

Die Vorlage startet mit THM links und ITI rechts im Header. Für BLiZ-Poster kann in `src/poster-config.tex` rechts auf BLiZ umgestellt werden:

```tex
\PosterUseBlizLogotrue
```

Der Außenrand beträgt standardmäßig 30 mm. Die Footer-Bar ist standardmäßig aktiv und bündelt Kontakt, QR-Code, Projekt, DOI, Lizenz oder Förderhinweis.

## Poster aus Abstract, Paper oder Notizen erstellen

Beispielauftrag:

```text
Erstelle ein verständliches DIN-A0-Konferenzposter aus den folgenden Notizen oder dem folgenden Abstract.
Erfinde keine Zahlen, Quellen oder Ergebnisse.
Markiere unklare Claims als TODO.
Reduziere Text stark und priorisiere eine klare Storyline.
```

## Visuelle Iteration

Nach dem Rendern sollte die PNG-Vorschau mit Bild-Input geprüft werden. Geeignete Prüfkriterien:

- Titel und Kernaussage sind aus Distanz schnell erfassbar.
- Die Leserichtung ist eindeutig.
- Die drei Spalten sind optisch ausgewogen.
- Keine Box wirkt überfüllt.
- Abbildungen sind groß genug und nicht textlastig.
- QR-Code, Kontakt und Event sind gut auffindbar.
- Die Außenränder sind drucksicher.

## Empfohlene Iterationsschleife

1. Inhalt grob einsetzen.
2. `make check` ausführen.
3. `make preview` ausführen.
4. PNG visuell prüfen.
5. Text kürzen und Layout anpassen.
6. Wiederholen, bis das Poster auf einer Gesamtseitenansicht ausgewogen wirkt.
7. Fachliche Endprüfung durch einen Menschen.

## Grenzen

- Codex kann Layout und Lesbarkeit unterstützen, ersetzt aber keine fachliche Prüfung.
- Codex soll keine Messwerte oder Ergebnisse erfinden.
- Generierte Bilder sind für Konzeptgrafiken geeignet, nicht als Ersatz für echte wissenschaftliche Datenplots.
- Vor Veröffentlichung müssen Bildrechte, Logo-Nutzung und QR-Code-Ziel geprüft werden.
