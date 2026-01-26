all: HELLO.COM

clean:
	del *.COM
	del *.LST

HELLO.COM: HELLO.ASM
	nasm -f bin HELLO.ASM -o HELLO.COM -l HELLO.LST
