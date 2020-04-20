TEX = $(wildcard *.tex)
PDF = $(TEX:.tex=.pdf)
BIB = $(wildcard *.bib)
BST = $(wildcard *.bst)
STY = $(wildcard *.sty)

all: $(PDF)

%.pdf: %.tex $(BIB) $(BST) $(STY)
	latexmk -lualatex $<

clean:
	git clean -Xdf $(addprefix -e !, $(PDF))

cleanall: clean
	rm -f $(PDF)

.PHONY: all clean cleanall
