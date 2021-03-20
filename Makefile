TEX=xelatex -interaction nonstopmode -halt-on-error -file-line-error
DIRS=$$(ls -d **/*/) 


.PHONY: clean all

Apuntes:
	cd ./1_TeoriaInformacion/Apuntes ; $(TEX) -jobname=Apuntes "\input{Apuntes.tex}" > Apuntes.log ; cd ../..
	cd ./2_CodificadoresCanal/Apuntes ; $(TEX) -jobname=Apuntes "\input{Apuntes.tex}" > Apuntes.log ; cd ../..
	cd ./3_AccesoMedio/Apuntes ; $(TEX) -jobname=Apuntes "\input{Apuntes.tex}" > Apuntes.log ; cd ../..

Practicas:
	cd ./1_TeoriaInformacion/Práctica ; $(TEX) -jobname=Práctica "\input{Práctica.tex}" > Práctica.log ; cd ../..
	cd ./2_CodificadoresCanal/Práctica ; $(TEX) -jobname=Práctica "\input{Práctica.tex}" > Práctica.log ; cd ../..

Bibliografia:
	cd ./4_Bibliografia ; $(TEX) -jobname=Bibliografía "\input{Bibliografía.tex}" > Bibliografía.log ; cd ..

all: Apuntes Practicas Bibliografia

clean:
	@for x in $(DIRS); do cd ./$$x ; pwd ; rm -f aux.tex *.out *aux *bbl *blg *log *toc *.ptb *.tod *.fls *.fdb_latexmk *.lof *.nav *.snm *.vrb *.dvi *.synctex.gz; cd ../.. ; done;

