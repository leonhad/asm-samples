.PHONY: all

all: mov

%.o : %.S
	as $< -o $@

mov: mov.o
	ld $< -o $@

clean:
	rm -f *.o mov
