TXT2DATA=./txt2data
TABFILE=/usr/lib/stardict-tools/tabfile
TXT2STARTAB=./txt2startab
DICTNAME=ham-code
DICTSUBJ="Словарь радиокодов"
DICTURL=https://github.com/stanislavvv/dict/

all: dict

dict:
	$(TXT2DATA) < $(DICTNAME).txt > $(DICTNAME).data
	dictfmt -p \
	        --allchars \
	        --utf8 \
	        --columns 0 \
	        -s $(DICTSUBJ) \
	        -u $(DICTURL) \
	        --without-time \
	        $(DICTNAME) < $(DICTNAME).data
	dictzip -k $(DICTNAME).dict

stardict:
	cat $(DICTNAME).txt | grep . | ./txt2startab >$(DICTNAME).tab
	$(TABFILE) $(DICTNAME).tab

clean:
	rm -f *.data *.dz *.dict *.index *.tab *.idx *.ifo
