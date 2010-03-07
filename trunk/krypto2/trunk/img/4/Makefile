.PHONY: images
images: *.mp
	for m in `find . | egrep '.*\.mp$$'`; do echo "metapost: $$m"; mpost -tex=latex $$m; if [ "$$?" -ne "0" ]; then exit 47; fi; done;
	for q in `find . | egrep '.*\.[0-9]+$$'`; do echo "moving: $$q"; mv $$q $$q.mps; done
	latex display.tex

.PHONY: clean
clean:
	-rm *.mps *.mpx *.log *.aux *.dvi
