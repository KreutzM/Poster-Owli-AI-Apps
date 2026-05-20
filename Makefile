.PHONY: pdf check preview visual-check clean distclean check-tools check-structure final-check

MAIN := main
LATEXMK := latexmk
LATEXMK_FLAGS := -pdf -interaction=nonstopmode -halt-on-error
PYTHON ?= $(shell command -v python3 2>/dev/null || command -v python 2>/dev/null || command -v py 2>/dev/null || echo python)

pdf:
	$(LATEXMK) $(LATEXMK_FLAGS) $(MAIN).tex

check: check-tools check-structure pdf

check-tools:
	@command -v $(LATEXMK) >/dev/null 2>&1 || { echo "ERROR: latexmk not found."; exit 1; }
	@$(PYTHON) --version >/dev/null 2>&1 || { echo "ERROR: Python not found."; exit 1; }

check-structure:
	$(PYTHON) scripts/check_structure.py

final-check: check
	$(PYTHON) scripts/check_placeholders.py

preview: pdf
	@command -v pdftoppm >/dev/null 2>&1 || { echo "ERROR: pdftoppm not found. Install poppler-utils."; exit 1; }
	mkdir -p build
	pdftoppm -png -singlefile -r 120 build/$(MAIN).pdf build/poster-preview

visual-check: preview
	@echo "PNG preview written to build/poster-preview.png"
	@echo "Suggested Codex command:"
	@echo "codex -i build/poster-preview.png \"Review this DIN-A0 poster visually. Check hierarchy, whitespace, text density, column balance, figure size, print readability, and concrete LaTeX improvements.\""

clean:
	$(LATEXMK) -C $(MAIN).tex
	rm -f *.aux *.bbl *.bcf *.blg *.fdb_latexmk *.fls *.fmt *.fot *.lof *.log *.lot *.out *.run.xml *.synctex.gz *.toc *.xdv *.nav *.snm *.vrb

distclean: clean
	rm -rf build
	rm -f $(MAIN).pdf
