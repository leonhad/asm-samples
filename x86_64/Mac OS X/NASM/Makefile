64: 64.o
	ld -macosx_version_min 10.7.0 -lSystem -o 64 64.o

64.o:
	nasm -f macho64 64.asm

all: 64

clean:
	rm -f 64.o 64