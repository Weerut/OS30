APP      = hello4
STACK    = 1k
MALLOC   = 0k

include ../app_make.txt

$(APP).hrb : $(APP).org Makefile
	cmd /c $(COPY) $(APP).org $(APP).hrb
