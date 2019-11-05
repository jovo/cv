LATEX = pdflatex
SPELL = aspell
TEX = jovo_cv
BIBTEX = biber

default: $(TEX).tex 
	$(LATEX) $(TEX); $(BIBTEX) $(TEX); $(LATEX) $(TEX); $(LATEX) $(TEX);
	$(RM) -f  *.blg *.dvi *.log *.toc *.lof *.lot *.cb *.bbl *.brf *.out *.aux $(TEX).ps 
	open -g $(TEX).pdf &

download:
	wget -N https://neurodata.io/bib_files/pubs_pre_prints.bib
	wget -N https://neurodata.io/bib_files/pubs_peer_reviewed.bib
	wget -N https://neurodata.io/bib_files/pubs_conf.bib
	wget -N https://neurodata.io/bib_files/pubs_tech_reports.bib
	wget -N https://neurodata.io/bib_files/pubs_other.bib
	wget -N https://neurodata.io/bib_files/pubs_excluded_entries.bib
	wget -N https://neurodata.io/bib_files/pubs_pre_prints.bib
	wget -N https://neurodata.io/bib_files/pubs_peer_reviewed.bib
	wget -N https://neurodata.io/bib_files/pubs_conf.bib
	wget -N https://neurodata.io/bib_files/pubs_tech_reports.bib
	wget -N https://neurodata.io/bib_files/pubs_other.bib
	wget -N https://neurodata.io/bib_files/talks_excluded_entries.bib
	wget -N https://neurodata.io/bib_files/talks_invited.bib
	wget -N https://neurodata.io/bib_files/talks_other.bib

view: $(TEX).tex 
	$(LATEX) $(TEX); $(BIBTEX) $(TEX); $(LATEX) $(TEX); $(LATEX) $(TEX)
	open $(TEX).pdf &

clean:
	$(RM) -f *.aux *.bcf *.blg *.dvi *.log *.toc *.lof *.lot *.cb *.bbl $(TEX).ps $(TEX).pdf *~

check:
	@echo "Passing the check will cause make to report Error 1."
	$(LATEX) $(TEX)  | grep -i undefined
