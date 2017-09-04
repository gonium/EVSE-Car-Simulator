# Produce PDFs from all Markdown files in a directory
# Lincoln Mullen | http://lincolnmullen.com | lincoln@lincolnmullen.com

# List files to be made by finding all *.md files and appending .pdf
PDFS := $(patsubst %.md,%.pdf,$(wildcard *.md))
HTMLS := $(patsubst %.md,%.html,$(wildcard *.md))
#DOCX := $(patsubst %.md,%.docx,$(wildcard *.md))
#TXTS := $(patsubst %.md,%.txt,$(wildcard *.md))

# The all rule makes all the PDF files listed
all : $(PDFS) $(HTMLS) #$(DOCX) $(TXTS)

# This generic rule accepts PDF targets with corresponding Markdown 
# source, and makes them using pandoc
%.pdf: %.md
	@echo "Zeichen im Artikel: `wc -m $<`"
	@pandoc $< -o $@ -s --smart --number-section --dpi 300 \
	  -V documentclass:scrartcl -V fontsize:12pt \
	  -V papersize:A4 -V lang:de -V toc

%.docx: %.md
	@pandoc $< -o $@ --smart


%.txt: %.md
	@pandoc --columns=70 --no-highlight -s $< -o $@


%.html: %.md
	@pandoc -s -S --toc -H pandoc.css $< -o $@

# Remove all PDF outputs
clean:
	@rm $(PDFS)
	@rm $(HTMLS)
#	@rm $(DOCX)
#	@rm $(TXTS)

# Remove all PDF outputs then build them again
rebuild : clean all

# Crop PDF images
crop:
	@pdfcrop --margins '1 1 1 1' Gantt-Diagramm.pdf Gantt-Diagramm-cropped.pdf

help:
	@echo "See http://pandoc.org/README.html#pandocs-markdown"
