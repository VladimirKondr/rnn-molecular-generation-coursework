#!/bin/bash

if [ $# -eq 0 ]; then
    DIR="."
else
    DIR="$1"
fi

if [ ! -d "$DIR" ]; then
    echo "Ошибка: директория $DIR не найдена"
    exit 1
fi

cd "$DIR"

rm -f *.aux
rm -f *.log
rm -f *.out
rm -f *.toc
rm -f *.bbl
rm -f *.bcf
rm -f *.blg
rm -f *.run.xml
rm -f *.fls
rm -f *.fdb_latexmk
rm -f *.synctex.gz
rm -f *.nav
rm -f *.snm
rm -f *.vrb
rm -f *.lof
rm -f *.lot
