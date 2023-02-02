# Produce PDFs from all Markdown files in a directory
# Lincoln Mullen | http://lincolnmullen.com | lincoln@lincolnmullen.com

# List files to be made by finding all *.md files and appending .pdf
PDFS := $(patsubst %.md,%.pdf,$(wildcard *.md))
HTMLS := $(patsubst %.md,%.html,$(wildcard *.md))
EPUBS := $(patsubst %.md,%.epub,$(wildcard *.md))

# The all rule makes all the PDF files listed
all : $(HTMLS) 

# This generic rule accepts PDF targets with corresponding Markdown 
# source, and makes them using pandoc
%.pdf: %.md
	@echo "Zeichen im Artikel: `wc -m $<`"
	@pandoc $< -o $@ -s -f markdown+smart --number-section --dpi 300 \
	  -V documentclass:scrartcl -V fontsize:12pt \
	  -V papersize:A4 -V lang:de -V toc \
	  -fmarkdown-implicit_figures 

%.html: %.md
	@pandoc $< -o $@ \
	  -s -f markdown+smart -t markdown-smart --number-section \
	  --toc \
	  --mathjax \
	  --email-obfuscation=javascript --to html5 \
	  -H headermeta.html -H pandoc.css \
# 	Deactivate google analytics
#	  -H googleanalytics.js

# TODO: Incorporate
# * http://bbebooksthailand.com/bb-epub-kindlegen-tutorial.html
# * https://puppet.com/blog/how-we-automated-our-ebook-builds-pandoc-and-kindlegen
%.epub: %.md
	@pandoc $< -o $@

deploy: all
	rsync -rzh *.html img md@evsim.gonium.net:/var/www/evsim.gonium.net

develop: $(HTMLS)
	python3 devmode.py

# Remove all PDF outputs
clean:
	@rm $(PDFS)
	@rm $(HTMLS)
#	@rm $(DOCX)
#	@rm $(TXTS)

# Remove all PDF outputs then build them again
rebuild : clean all

help:
	@echo "See http://pandoc.org/README.html#pandocs-markdown"
