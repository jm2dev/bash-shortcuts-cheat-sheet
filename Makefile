help: 	## Print this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

fichero=README

build:	html	## build output

pdf:	## create pdf
	pandoc --pdf-engine=xelatex -o $(fichero).pdf --from markdown --template eisvogel --listings -V titlepage=false $(fichero).md

html:	## create html
	pandoc -o $(fichero).html $(fichero).md

run:    ## open html
	firefox $(fichero).html

clean:	## Delete output files
	rm *.pdf
