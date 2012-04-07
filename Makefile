NAME = main

TARGET = $(NAME).dvi
DVITARGET = $(NAME).dvi
PDFTARGET = $(NAME).pdf
SRC = $(wildcard *.tex)
PT = xelatex
LT = latex
TOC = $(NAME).toc
AUX = $(NAME).aux
BBL = $(NAME).bbl





$(PDFTARGET) : $(NAME).tex $(SRC) 
	$(PT) $<
clean : 
	rm -f *.log *.out *.pdf *.dvi *.aux
%.dvi : %.tex
	$(LT) $<
%.pdf : %.tex
	$(PT) $<
s : $(PDFTARGET)
	if [ -e $(NAME).pdf ] ;then	evince $(NAME).pdf ;	fi
	if [ -e $(NAME).dvi ] ;then 	evince $(NAME).dvi ;	fi
	cp $(NAME).tex $(NAME).tex_back
$(TOC) : $(NAME).tex  $(SRC)
	$(PT) $<
	rm -f $(PDFTARGET)
$(AUX) : $(NAME).tex  $(SRC)
	$(PT) $<
	rm -f $(PDFTARGET)
$(BBL) : $(AUX)
	bibtex $<
ss : 
	if [ -e $(NAME).pdf ] ;then     evince $(NAME).pdf ;    fi
	if [ -e $(NAME).dvi ] ;then     evince $(NAME).dvi ;    fi
