all: BOOT.IMG

clean:
	del *.BIN
	del *.LST

run:
	qemu-system-i386 -boot a -fda BOOT.IMG

BOOT.IMG: BOOT.ASM
	nasm -f bin BOOT.ASM -o BOOT.IMG -l BOOT.LST
