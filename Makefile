all: data dict dist

data:
	./txt2data < ham-code.txt > ham-code.data

dict:
	dictfmt -p \
	        --allchars \
	        --utf8 \
	        --columns 0 \
	        -s "Словарь радиокодов" \
	        --without-time \
	        "ham-code" < "ham-code.data"


dist:
	dictzip -k ham-code.dict

clean:
	rm -f *.data *.dz *.dict *.index
