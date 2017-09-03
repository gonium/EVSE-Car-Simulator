DOCS=main.adoc

all: $(DOCS) html pdf epub

html: $(DOCS)
	asciidoc -v $<

pdf: $(DOCS)
	a2x -fpdf -dbook --fop --no-xmllint -v $<

epub: $(DOCS)
	a2x -fepub -dbook --no-xmllint -v $<

clean:
	rm -f *.html *.pdf *.epub

