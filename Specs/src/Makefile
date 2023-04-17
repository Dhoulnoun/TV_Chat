FILE=specifications

TEX=$(FILE).tex
DVI=$(FILE).dvi
PS=$(FILE).ps
PDF=$(FILE).pdf

VIEWER=evince

ALL = $(PDF) $(PS) $(DVI)

# CONTROLE 
	
view: $(PDF)
	$(VIEWER) $(PDF) &

$(PDF): $(DVI)
	dvipdf $(DVI)

$(DVI): $(TEX) 
	(latex $(TEX) && latex $(TEX) && latex $(TEX)) || ($(MAKE) clean; exit 1)

clean:
	rm -f $(DVI) $(PDF) *.log *.out *.aux *.toc *.nav *.snm *.vrb *.blg *.bbl *.lof *.dvi

mrproper : clean
	rm -rf $(ALL)

new: mrproper view


