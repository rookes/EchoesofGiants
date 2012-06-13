MXMLC = ~/../../Library/flex_sdk_4.6.0.23201B/bin/mxmlc
SRC = src/
MAIN = src/Main.as
SWF = bin/EchoesofGiants.swf

$(SWF) : $(SRC)
	    $(MXMLC) -o $(SWF) -static-link-runtime-shared-libraries -- $(MAIN)

run : $(SWF)
	open $(SWF)
