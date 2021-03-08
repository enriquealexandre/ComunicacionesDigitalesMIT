# Customize these two lines
TARGETS=es # Courses to compile
NAME=Apuntes

# Do not touch
TEX=xelatex -interaction nonstopmode -halt-on-error -file-line-error
FILENAME=$(NAME).tex


.PHONY: clean

all:
	$(TEX) -jobname=$(NAME) "\input{$(FILENAME)}" > $(NAME).log
	
clean:
	rm -f *.out *aux *bbl *blg *log *toc *.ptb *.tod *.fls *.fdb_latexmk *.lof *.nav *.snm *.vrb *.dvi *.synctex.gz

