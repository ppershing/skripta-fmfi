default: pdf

main.dvi: */*.tex *.tex Makefile img/*
	cslatex main
	cslatex main
	cslatex main

main.ps: main.dvi
	dvips main.dvi

quietps: *.tex Makefile img/*
	cslatex -interaction=batchmode main
	cslatex -interaction=batchmode main
	cslatex -interaction=batchmode main
	dvips main.dvi

release: 
	# ~/bin/foja-release
	scp -q main.pdf misof@foja:public_html/foja-skripta-snapshot.pdf

dvi: main.dvi

ps: main.ps

main.pdf: *.tex Makefile img/*
	rm -f *.toc
	pdfcslatex main
	# bibtex main
	pdfcslatex main
	pdfcslatex main

pdf: main.pdf

html: dvi 
	for i in * ; do if [ ! -d "$i"] ; then cp "$i" html ; fi ; done
	cd html ; latex2html -html_version 4.0 -no_navigation -no_subdir -info 0 main.tex ; cd ..

clean: 
	rm -f *.{log,aux}

dist-clean:
	rm -f *.{log,aux,dvi,ps,pdf,toc,bbl,blg,slo,srs}

backup: 
	tar --create --force-local -zf zaloha/knizka-`date +%Y-%m-%d-%H\:%M`.tar.gz `ls -p| egrep -v /$ ` images/* code/*

all: ps pdf


booklet: main.ps
	cat main.ps | psbook | psnup -2 >main-booklet.ps

