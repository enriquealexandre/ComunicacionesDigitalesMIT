TEX=xelatex -interaction nonstopmode -halt-on-error -file-line-error
DIRS=$$(ls -d **/*/) 


.PHONY: clean all

Apuntes:
	cd ./Tema_1/Apuntes ; $(TEX) -jobname=Apuntes "\input{Apuntes.tex}" > Apuntes.log ; cd ../..
	cd ./Tema_2/Apuntes ; $(TEX) -jobname=Apuntes "\input{Apuntes.tex}" > Apuntes.log ; cd ../..
	cd ./Tema_3/Apuntes ; $(TEX) -jobname=Apuntes "\input{Apuntes.tex}" > Apuntes.log ; cd ../..

Practicas:
	cd ./Tema_1/Práctica ; $(TEX) -jobname=Práctica "\input{Práctica.tex}" > Práctica.log ; cd ../..
	cd ./Tema_2/Práctica ; $(TEX) -jobname=Práctica "\input{Práctica.tex}" > Práctica.log ; cd ../..
	cd ./Tema_3/Práctica ; $(TEX) -jobname=Práctica "\input{Práctica.tex}" > Práctica.log ; cd ../..

Bibliografia:
	cd ./Bibliografía ; $(TEX) -jobname=Bibliografía "\input{Bibliografía.tex}" > Bibliografía.log ; cd ..

all: Apuntes Practicas Bibliografia

clean:
	@for x in $(DIRS); do cd ./$$x ; pwd ; rm -f aux.tex *.out *aux *bbl *blg *log *toc *.ptb *.tod *.fls *.fdb_latexmk *.lof *.nav *.snm *.vrb *.dvi *.synctex.gz; cd ../.. ; done;

