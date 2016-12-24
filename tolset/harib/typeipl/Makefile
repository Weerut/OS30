APP      = typeipl
STACK    = 1k
MALLOC   = 0k

include ../app_make.txt

haribote.img : ../haribote/ipl10.bin ../haribote/haribote.sys $(APP).hrb \
		Makefile ../app_make.txt ../haribote/ipl10.nas
	$(EDIMG)   imgin:../../z_tools/fdimg0at.tek \
		wbinimg src:../haribote/ipl10.bin len:512 from:0 to:0 \
		copy from:../haribote/haribote.sys to:@: \
		copy from:$(APP).hrb to:@: \
		copy from:../haribote/ipl10.nas to:@: \
		imgout:haribote.img