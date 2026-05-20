# Layout-Guide für DIN-A0-Poster

## Was gegenüber einer einfachen Overleaf-Vorlage verbessert wurde

- Zentrale Konfiguration für Titel, Kontakt, Farben, Logos, Footer und Abstände in `src/poster-config.tex`.
- Inhalt, Design und Build-Logik sind getrennt.
- Drei gleich breite Spalten reduzieren Zeilenlängen und verbessern die Lesbarkeit.
- Eine vollbreite Take-away-Zeile zwingt zu einer klaren Kernbotschaft.
- THM und ITI sind als institutionelle Header-Defaults vorkonfiguriert; BLiZ ist per Schalter auswählbar.
- Kennzahlen, Tags, Abbildungsplatzhalter und Footer-Bar sind als Makros wiederverwendbar.
- Standardisierte Build-, Preview-, Visual-Check- und Final-Checks erleichtern die Arbeit in Git, Overleaf und CI.

## Format

- DIN A0 Hochformat: ca. 841 × 1189 mm.
- Sicherer Außenrand: standardmäßig 30 mm.
- Für Druckdaten beim Anbieter prüfen: Beschnittzugabe, Farbprofil, Mindestauflösung und PDF/X-Anforderungen.

## Typografie

- Titel: sehr groß, maximal zwei Zeilen.
- Blocktitel: kurz und eindeutig.
- Fließtext: kurze Absätze; lieber Listen und Abbildungen.
- Vermeide Blocksatz bei sehr schmalen Spalten, wenn unschöne Wortabstände entstehen. Die Vorlage nutzt `\justifying`, kann aber blockweise auf `\raggedright` geändert werden.

## Header-Logos

Die Vorlage nutzt standardmäßig:

- links: `assets/logos/logo_thm.pdf`,
- rechts: `assets/logos/logo_iti.png`.

Für BLiZ-Poster kann in `src/poster-config.tex` rechts das BLiZ-Logo aktiviert werden:

```tex
\PosterUseBlizLogotrue
```

Die Logo-Makros behalten Platzhalter bei, falls Dateien fehlen. Für die produktive Nutzung sollten Logo-Dateien und Rechte aber geprüft sein.

## Abbildungen

- Lieber eine große Hauptabbildung als viele kleine Einzelbilder.
- Rastergrafiken: 150–300 dpi in finaler Druckgröße.
- Vektorgrafiken bevorzugt als PDF/SVG-konvertiertes PDF.
- Bildunterschriften erklären Bedeutung, nicht nur Inhalt.

## Footer-Bar

Die Vorlage nutzt standardmäßig eine dunkle, vollbreite Footer-Bar. Sie bündelt Informationen, die schnell auffindbar sein sollen, ohne die fachlichen Inhaltsboxen zu überladen.

Geeignete Inhalte:

- QR-Code und Kurzlink,
- Kontaktperson oder Projektkontakt,
- Institution, Projekt oder Veranstaltung,
- Förderhinweis, DOI, Lizenz oder Repository.

Gestaltungsempfehlungen:

- Footer-Bar sparsam nutzen und nicht mit Kleingedrucktem überladen.
- QR-Code mindestens 30–35 mm groß setzen.
- Kurze URL zusätzlich zum QR-Code angeben.
- Helle Schrift auf dunklem Hintergrund ausreichend groß setzen.
- Die Footer-Bar ist in `src/poster-config.tex` mit `\PosterUseFooterBartrue` voreingestellt.
- Nur bei Bedarf kann sie mit `\PosterUseFooterBarfalse` durch einen kompakten Text-Footer ersetzt werden.

## QR-Code

- QR-Code groß genug drucken, typischerweise mindestens 25–30 mm Kantenlänge, in der Footer-Bar eher 30–35 mm.
- Vor dem Druck mit mehreren Smartphones testen.
- Zusätzlich kurze URL als Text angeben, falls der QR-Code nicht scannt.
