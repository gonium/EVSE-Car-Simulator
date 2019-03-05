pdflatex=pdflatex
converter=pdftoppm

SRC=sticker.tex
AUX=$(SRC:.tex=.aux)
PDF=$(SRC:.tex=.pdf)
PNG=$(SRC:.tex=.png)

default: all

all: $(PDF) $(PNG)

$(PDF): $(SRC)
	-rm -f $(AUX)
	$(pdflatex) $<

$(PNG): $(PDF)
	$(converter) $< $@ -png -rx 150 -ry 150

view: pdf
	open $(PDF)

clean:
	-rm -f *~
	-rm -f $(AUX)
	-rm -f *.log
	-rm -f *.bbl
	-rm -f *.out
	-rm -f *.blg
	-rm -f fax.g3.*

.PHONY: default all clean
