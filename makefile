MXMLC = ~/../../Library/flex_sdk_4.6.0.23201B/bin/mxmlc
WMXMLC = ..\Library\flex_sdk_4.6.0.23201B\bin\mxmlc
SRC = src/
MAIN = src/Main.as
SWF = bin/EchoesofGiants.swf
UNAME := $(shell uname)

ifeq ($(UNAME), Darwin)

$(SWF) : $(SRC)
	$(MXMLC) -o $(SWF) -static-link-runtime-shared-libraries -- $(MAIN)

run : $(SWF)
	open $(SWF)

else

$(SWF) : $(SRC)*
	$(WMXMLC) -o $(SWF) -static-link-runtime-shared-libraries -- $(MAIN)

endif
