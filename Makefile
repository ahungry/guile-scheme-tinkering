# Basic file
CFLAGS = `guile-config compile`
LIBS = `guile-config link`
LDFLAGS = -lm

.PHONY: clean build run

all: tortoise

clean:
	rm -f tortoise tortoise.o

run: tortoise
	./tortoise

# TODO: Send note to https://www.gnu.org/software/guile/docs/guile-tut/tutorial.html missing lm flag
tortoise: tortoise.o
	gcc $< -o $@ $(LIBS) $(LDFLAGS)

tortoise.o: tortoise.c
	gcc -c $< -o $@ $(CFLAGS)
