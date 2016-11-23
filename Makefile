# (C) Copyright 2016
# Urs Fässler, www.bitzgi.ch
# SPDX-License-Identifier: CC-BY-SA-4.0

handname=handout
slidename=slide
pdfname=gpl_mit_wtf

slidetex=$(slidename).tex
handouttex=$(handname).tex
slidepdf=$(pdfname)_$(slidename).pdf
handoutpdf=$(pdfname)_$(handname).pdf

merged: handout slide
	gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=$(pdfname).pdf $(handoutpdf) $(slidepdf)

handout:
	pdflatex -draftmode -halt-on-error $(handouttex) 1> /dev/null
	pdflatex -halt-on-error $(handouttex) 1> /dev/null
	mv $(handname).pdf $(handoutpdf)

slide:
	pdflatex -draftmode -halt-on-error $(slidetex) 1> /dev/null
	pdflatex -halt-on-error $(slidetex) 1> /dev/null
	mv $(slidename).pdf $(slidepdf)

debug:
	pdflatex $(handouttex)

clean:
	rm -f *.log *.toc *.aux *.bbl *.blg *.lof *.lot *.out *.bak *.nav *.snm *.vrb

clear: 
	rm -f *.dvi *.pdf *.ps

