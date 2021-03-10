TEX=xelatex -interaction nonstopmode -halt-on-error -file-line-error


.PHONY: clean

all:
	$(TEX) -jobname=Apuntes "\input{Apuntes.tex}" > Apuntes.log
	$(TEX) -jobname=Transparencias "\input{Transparencias.tex}" > Transparencias.log
	
clean:
	rm -f *.out *aux *bbl *blg *log *toc *.ptb *.tod *.fls *.fdb_latexmk *.lof *.nav *.snm *.vrb *.dvi *.synctex.gz

