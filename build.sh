#!/bin/bash

cd sources

echo "Шаг 1/4: Первая компиляция XeLaTeX..."
xelatex -interaction=nonstopmode main.tex > /dev/null

echo "Шаг 2/4: Обработка библиографии (biber)..."
biber main > /dev/null

echo "Шаг 3/4: Вторая компиляция XeLaTeX..."
xelatex -interaction=nonstopmode main.tex > /dev/null

echo "Шаг 4/4: Финальная компиляция XeLaTeX..."
xelatex -interaction=nonstopmode main.tex > /dev/null

echo ""
echo "Очистка временных файлов..."
rm -f *.aux *.log *.out *.toc *.bbl *.bcf *.blg *.run.xml *.fls *.fdb_latexmk *.synctex.gz *.nav *.snm *.vrb *.lof *.lot

cd ..

echo "Копирование PDF в корень проекта..."
mv sources/main.pdf ./main.pdf

echo ""
echo "========================================"
echo "Сборка завершена!"
echo "PDF файл: sources/main.pdf"
echo "PDF файл скопирован в: main.pdf"
echo "========================================"
