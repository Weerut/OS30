
# デフォルト動作

default :
	make.exe img

# ファイル生成規則

ipl.bin : ipl.nas Makefile
	../z_tools/nask.exe ipl.nas ipl.bin ipl.lst

helloos.img : ipl.bin Makefile
	../z_tools/edimg.exe   imgin:../z_tools/fdimg0at.tek \
		wbinimg src:ipl.bin len:512 from:0 to:0   imgout:helloos.img

# コマンド

asm :
	make.exe -r ipl.bin

img :
	make.exe -r helloos.img

run :
	make.exe img
	cmd.exe /C copy /Y helloos.img ..\z_tools\qemu\fdimage0.bin
	make.exe -C ../z_tools/qemu

install :
	make.exe img
	../z_tools/imgtol.com w a: helloos.img

clean :
	cmd.exe /C del ipl.bin
	cmd.exe /C del ipl.lst

src_only :
	make.exe clean
	cmd.exe /C del helloos.img

