default: fast

.PHONY: fast
fast:
	cslatex main

learnlist.dvi: learnlist.tex
	cslatex learnlist

main.dvi: */*.tex *.tex Makefile img/*
	cslatex main
	#bibtex main
	cslatex main
	cslatex main

main.ps: main.dvi
	dvips main.dvi

quietps: *.tex Makefile img/*
	cslatex -interaction=batchmode main
	cslatex -interaction=batchmode main
	cslatex -interaction=batchmode main
	dvips main.dvi

dvi: main.dvi

ps: main.ps

main.pdf: main.ps
	ps2pdf main.ps

commented:
	# this is commented due to problem with pdfcslatex on windows
	#rm -f *.toc
	#pdfcslatex main
	## bibtex main
	#pdfcslatex main
	#pdfcslatex main

pdf: main.pdf

html: dvi 
	for i in * ; do if [ ! -d "$i"] ; then cp "$i" html ; fi ; done
	cd html ; latex2html -html_version 4.0 -no_navigation -no_subdir -info 0 main.tex ; cd ..

.PHONY: clean
clean: 
	rm -f *.{log,aux}

.PHONY: dist-clean
dist-clean:
	rm -f *.{log,aux,dvi,ps,pdf,toc,bbl,blg,slo,srs,out,bak,lot,lof}

backup: 
	tar --create --force-local -zf zaloha/knizka-`date +%Y-%m-%d-%H\:%M`.tar.gz `ls -p| egrep -v /$ ` images/* code/*

all: ps pdf


booklet: main.ps
	cat main.ps | psbook | psnup -2 >main-booklet.ps

.PHONY: img
img:
	(cd img; make all)

# windows version of prepare_upload, deprecated
#distributable: dist-clean pdf
#	cp main.pdf logika_%date:~6%-%date:~3,2%-%date:~0,2%.pdf
	
.PHONY: prepare_upload
prepare_upload: dist-clean img main.pdf
	cp main.pdf `date '+logika_%y-%m-%d.pdf'`
