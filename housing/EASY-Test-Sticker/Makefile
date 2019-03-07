latex=xelatex
pdf2png=pdftoppm
# Install PDFJam, https://warwick.ac.uk/fac/sci/statistics/staff/academic-research/firth/software/pdfjam
nup=pdfnup

SRC=sticker.tex
AUX=$(SRC:.tex=.aux)
PDF=$(SRC:.tex=.pdf)
FOURPDF=$(SRC:.tex=-2x2.pdf)
PNG=$(SRC:.tex=.png)

default: all

all: $(PDF) $(PNG) pdfnup

$(PDF): $(SRC)
	@-rm -f $(AUX)
	$(latex) $<

$(PNG): $(PDF)
	@$(pdf2png) $< $@ -png -rx 150 -ry 150

pdfnup: $(PDF)
	@$(nup) --nup 2x2 --a4paper --scale 1.0 --landscape $(PDF) $(PDF) $(PDF) $(PDF) --outfile $(FOURPDF)

view: $(PDF)
	open $(PDF)

clean:
	-rm -f *~
	-rm -f $(AUX)
	-rm -f *.log
	-rm -f *.bbl
	-rm -f *.out
	-rm -f *.blg
	-rm -f $(FOURPDF)
	-rm -f $(PNG)

.PHONY: default all clean
