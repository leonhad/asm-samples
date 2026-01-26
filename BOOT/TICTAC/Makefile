all: TICTAC.COM

clean:
	del *.COM
	del *.LST

TICTAC.COM: TICTAC.ASM
	nasm -f bin TICTAC.ASM -o TICTAC.COM -l TICTAC.LST
