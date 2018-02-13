.PHONY: all
LATEX-ENGINE = lualatex
INPUT-FILES = $(wildcard *.md)
OUTPUT-FILE = assignment.pdf
TEMPLATE = generic.tex
CITE = lib.bib


all:
	pandoc                             \
	  --filter pandoc-citeproc		   \
	  --bibliography $(CITE)        \
	  --from         markdown          \
	  --to           latex             \
	  --template     $(TEMPLATE)       \
	  --out          $(OUTPUT-FILE)	   \
	  --latex-engine $(LATEX-ENGINE)   \
	  -s $(INPUT-FILES) 

