# Tools
LATEXMK = latexmk
RM = rm -f

# Project-specific settings
# example: make FNAME=hw4
DOCNAME = $(FNAME)

# Targets
all: main.pdf
doc: $(DOCNAME).pdf

# Rules
%.pdf: %.tex
	$(LATEXMK) -pdf -M -MP -MF $*.d $*

mostlyclean:
	$(LATEXMK) -silent -c
	$(RM) *.bbl
	$(RM) *.d
	$(RM) *-blx.bib
	$(RM) fig/*-eps-converted-to.pdf

clean: mostlyclean
	$(LATEXMK) -silent -C
	$(RM) *.run.xml *.synctex.gz
	$(RM) *.d
	$(RM) *-blx.bib
	$(RM) fig/*-eps-converted-to.pdf

.PHONY: all clean doc mostlyclean pdf

# Include auto-generated dependencies
-include *.d
