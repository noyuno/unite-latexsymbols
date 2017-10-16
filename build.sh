#!/bin/bash -e

INPUT=latexsymbols
INPUT2=$INPUT.vim
OUTPUT=autoload/unite/sources/$INPUT2
[ -f "$OUTPUT" ] && rm "$OUTPUT"
echo 'let g:'$INPUT' = [' > "$OUTPUT"
for line in `cat $INPUT | grep -v ^\#`; do
    word=`echo $line | cut -d ',' -f 1`
    tex=`echo $line | cut -d ',' -f 2`
    echo "\ { 'word': '$word    $tex', 'action__tex': '$tex' }, " >> "$OUTPUT"
done
echo '\ ]' >> "$OUTPUT"
cat "$INPUT2" >> "$OUTPUT"

