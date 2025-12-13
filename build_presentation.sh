#!/bin/bash

cd sources

echo "Шаг 1/2: Первая компиляция XeLaTeX..."
pdflatex presentation.tex > /dev/null

echo "Шаг 2/2: Вторая компиляция XeLaTeX..."
pdflatex presentation.tex > /dev/null

echo ""
echo "Очистка временных файлов..."
rm -f *.aux *.log *.out *.toc *.bbl *.bcf *.blg *.run.xml *.fls *.fdb_latexmk *.synctex.gz *.nav *.snm *.vrb *.lof *.lot

cd ..

echo "Копирование PDF в корень проекта..."
mv sources/presentation.pdf ./presentation.pdf

echo ""
echo "========================================"
echo "Сборка завершена!"
echo "PDF файл: sources/presentation.pdf"
echo "PDF файл скопирован в: presentation.pdf"
echo "========================================"
