PAPER 		= paper

CLS_FILES	= $(shell find . -name '*.cls')
TEX_FILES	= $(shell find . -name '*.*tex')
BIB_FILES	= $(shell find . -name '*.bib')
FIG_FILES	= $(shell find ./figures)
MD_FILES	= $(shell find ./sections -name '*.md' | sort)
EXTRA_FILES	= $(shell find ./extra -name '*.md' | sort)

DEP_FILES	= Makefile metadata.yaml $(CLS_FILES) $(BIB_FILES) $(MD_FILES) $(FIG_FILES)

all: $(PAPER).pdf

edit:
	$(EDITOR) $(MD_FILES)

$(PAPER).pdf: $(PAPER).tex
	pdflatex $(PAPER) || bibtex $(PAPER)
	bibtex $(PAPER) || pdflatex $(PAPER)
	pdflatex $(PAPER) || bibtex $(PAPER)

$(PAPER).tex: $(DEP_FILES)
	pandoc \
		--standalone \
		--natbib \
		--smart \
		--listings \
		--template=./template.latex \
		-H custom.latex \
		--from=markdown \
		metadata.yaml $(MD_FILES) -o $(PAPER).tex

tidy:
	$(RM) *.aux
	$(RM) *.log
	$(RM) *.out
	$(RM) *.toc
	$(RM) *.bbl
	$(RM) *.blg
	$(RM) *.lot
	$(RM) *.lof
	$(RM) *.nlo
	$(RM) *.nls
	$(RM) *.ilg
	$(RM) *.run.xml
	$(RM) *.bcf


clean: tidy
	$(RM) $(PAPER).pdf
	$(RM) $(PAPER).tex
	$(RM) $(PAPER).html
	$(RM) -r tmp
