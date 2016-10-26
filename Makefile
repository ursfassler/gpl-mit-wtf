
handname=handout
slidename=slide
bibname=literature
pdfname=gpl_mit_wtf

merged: handout slide
	gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=$(pdfname).pdf $(pdfname)_$(slidename).pdf $(pdfname)_$(handname).pdf

handout:
	pdflatex -draftmode -halt-on-error $(handname).tex 1> /dev/null
	bibtex $(handname) 1> /dev/null
	pdflatex -draftmode -halt-on-error $(handname).tex 1> /dev/null
	pdflatex -halt-on-error $(handname).tex 1> /dev/null
	mv $(handname).pdf $(pdfname)_$(handname).pdf

slide:
	pdflatex -draftmode -halt-on-error $(slidename).tex 1> /dev/null
	pdflatex -halt-on-error $(slidename).tex 1> /dev/null
	mv $(slidename).pdf $(pdfname)_$(slidename).pdf

debug:
	pdflatex $(handname).tex


clean:
	rm -f $(bibname)-blx.bib *.log *.toc *.aux *.bbl *.blg *.lof *.lot *.out *.bak *.nav *.snm *.vrb

clear: 
	rm -f *.dvi *.pdf *.ps

