#!/bin/bash

echo "========================================"
echo "Очистка временных файлов LaTeX..."
echo "========================================"
echo ""

cd sources

echo "Очистка sources/..."
rm -f *.aux *.log *.out *.toc *.bbl *.bcf *.blg *.run.xml *.fls *.fdb_latexmk *.synctex.gz *.nav *.snm *.vrb *.lof *.lot

echo "Очистка sources/chapters/..."
cd chapters
rm -f *.aux *.log *.out *.toc *.bbl *.bcf *.blg *.run.xml *.fls *.fdb_latexmk *.synctex.gz *.nav *.snm *.vrb *.lof *.lot
cd ..

echo "Очистка sources/frontmatter/..."
cd frontmatter
rm -f *.aux *.log *.out *.toc *.bbl *.bcf *.blg *.run.xml *.fls *.fdb_latexmk *.synctex.gz *.nav *.snm *.vrb *.lof *.lot
cd ..

echo "Очистка sources/backmatter/..."
cd backmatter
rm -f *.aux *.log *.out *.toc *.bbl *.bcf *.blg *.run.xml *.fls *.fdb_latexmk *.synctex.gz *.nav *.snm *.vrb *.lof *.lot
cd ..

echo "Очистка кэша biber..."
rm -rf `biber --cache` 2>/dev/null

echo ""
echo "========================================"
echo "Очистка завершена!"
echo "PDF файлы сохранены"
echo "========================================"
