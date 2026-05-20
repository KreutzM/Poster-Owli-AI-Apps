# Keep generated files out of the repository root.
$pdf_mode = 1;
$out_dir = 'build';
$pdflatex = 'pdflatex -interaction=nonstopmode -halt-on-error %O %S';
$clean_ext = 'bbl run.xml synctex.gz nav snm vrb';
