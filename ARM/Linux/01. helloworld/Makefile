.PHONY: all

all: helloworld

%.o : %.S
	as $< -o $@

helloworld: helloworld.o
	ld $< -o $@

clean:
	rm -f *.o helloworld
