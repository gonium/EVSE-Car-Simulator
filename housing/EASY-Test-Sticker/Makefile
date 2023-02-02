latex=xelatex
pdf2png=pdftoppm

SRC=BOPLA-ET-220.tex BOPLA-ET-215.tex generic_threephase_sticker.tex
PDF=$(SRC:.tex=.pdf)
PNG=$(SRC:.tex=.png)

default: all

all: $(PDF) $(PNG)

%.pdf: %.tex
	@-rm -f $(AUX)
	$(latex) -interaction=nonstopmode -shell-escape $<
	@echo "Source files: $(SRC)"
	@echo "PDF files: $(PDF)"

%.png: %.pdf
	@$(pdf2png) $< $@ -png -rx 150 -ry 150

view: $(PDF)
	open $(PDF)

fonts: $(PDF)
	pdffonts $<

clean:
	-rm -f *~
	-rm -f *.aux
	-rm -f *.log
	-rm -f *.bbl
	-rm -f *.out
	-rm -f *.blg
	-rm -f $(PDF)
	-rm -f *.png

.PHONY: default all clean
