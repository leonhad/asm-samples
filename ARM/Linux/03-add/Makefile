.PHONY: all

all: add

%.o : %.S
	as $< -o $@

add: add.o
	ld $< -o $@

clean:
	rm -f *.o add
