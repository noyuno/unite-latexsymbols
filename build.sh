#!/bin/bash -e

INPUT=symbols
INPUT2=symbols.vim
OUTPUT=autoload/unite/sources/symbols.vim
[ -f "$OUTPUT" ] && rm "$OUTPUT"
echo 'let g:latex_symbols = [' > "$OUTPUT"
for line in `cat $INPUT | grep -v ^\#`; do
    word=`echo $line | cut -d ',' -f 1`
    tex=`echo $line | cut -d ',' -f 2`
    echo "\ { 'word': '$word    $tex', 'action__tex': '$tex' }, " >> "$OUTPUT"
done
echo '\ ]' >> "$OUTPUT"
cat "$INPUT2" >> "$OUTPUT"

