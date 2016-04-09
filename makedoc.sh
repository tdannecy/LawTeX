#!/bin/bash
BASENAME=`basename $1 .sty`
#cat $1 | sed -n 's/^\%\%\(.*\)/\1/p' > $BASENAME-doc.tex; pdflatex $BASENAME-doc.tex 

cat bluebook.sty | sed -n 's/^\%\%\(.*\)/\1/p' > .bluebook-doc.tex
cat lawbrief.cls | sed -n 's/^\%\%\(.*\)/\1/p' > .lawbrief-doc.tex
cat arbitrationbrief.cls | sed -n 's/^\%\%\(.*\)/\1/p' > .arbitrationbrief-doc.tex
pdflatex lawtex-doc.tex

