#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Использование: $0 <файл.tex>"
    echo ""
    echo "Примеры:"
    echo "  $0 chapters/chapter1.tex          # Глава 1"
    echo "  $0 chapters/chapter2.tex          # Глава 2"
    echo "  $0 chapters/chapter3.tex          # Глава 3"
    echo "  $0 frontmatter/introduction.tex   # Введение"
    echo "  $0 backmatter/conclusion.tex      # Заключение"
    echo "  $0 frontmatter/notations.tex      # Перечень сокращений"
    exit 1
fi

FILE="$1"

if [ ! -f "sources/$FILE" ]; then
    echo "Ошибка: файл sources/$FILE не найден"
    exit 1
fi

cd sources

BASENAME=$(basename "$FILE" .tex)
DIRNAME=$(dirname "$FILE")

echo "========================================"
echo "Компиляция файла: $FILE"
echo "========================================"
echo ""

cd "$DIRNAME"

if [ ! -e "backmatter" ]; then
    ln -s ../backmatter backmatter 2>/dev/null || true
fi

echo "Шаг 1/4: Первая компиляция XeLaTeX..."
xelatex -interaction=nonstopmode "$BASENAME.tex" > /dev/null 2>&1

echo "Шаг 2/4: Обработка библиографии (biber)..."
biber "$BASENAME" > /dev/null 2>&1

echo "Шаг 3/4: Вторая компиляция XeLaTeX..."
xelatex -interaction=nonstopmode "$BASENAME.tex" > /dev/null 2>&1

echo "Шаг 4/4: Финальная компиляция XeLaTeX..."
xelatex -interaction=nonstopmode "$BASENAME.tex" > /dev/null 2>&1

echo ""
echo "Очистка временных файлов..."
rm -f *.aux *.log *.out *.toc *.bbl *.bcf *.blg *.run.xml *.fls *.fdb_latexmk *.synctex.gz *.nav *.snm *.vrb *.lof *.lot

if [ -L "backmatter" ]; then
    rm backmatter
fi

echo ""
echo "========================================"
echo "Компиляция завершена!"
echo "PDF файл: sources/$DIRNAME/$BASENAME.pdf"
echo "========================================"
