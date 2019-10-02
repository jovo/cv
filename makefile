LATEX = pdflatex
SPELL = aspell
TEX = jovo_cv
BIBTEX = bibtex

default: $(TEX).tex 
	$(LATEX) $(TEX); $(BIBTEX) other.aux; $(BIBTEX) pre.aux; $(BIBTEX) pres.aux; $(BIBTEX) peer.aux; $(BIBTEX) conf.aux; $(BIBTEX) talks.aux; $(BIBTEX) prog.aux; $(BIBTEX) unp.aux; $(BIBTEX) press.aux; $(LATEX) $(TEX); $(LATEX) $(TEX);
	$(RM) -f  *.blg *.dvi *.log *.toc *.lof *.lot *.cb *.bbl *.brf *.out *.aux $(TEX).ps 
	open -g $(TEX).pdf &

view: $(TEX).tex 
	$(LATEX) $(TEX); $(BIBTEX) $(TEX); $(LATEX) $(TEX); $(LATEX) $(TEX)
	open $(TEX).pdf &

clean:
	$(RM) -f *.aux *.blg *.dvi *.log *.toc *.lof *.lot *.cb *.bbl $(TEX).ps $(TEX).pdf *~

check:
	@echo "Passing the check will cause make to report Error 1."
	$(LATEX) $(TEX)  | grep -i undefined
