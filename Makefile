CC = gcc -std=gnu99
CFLAGS := -Wall -Wextra -pedantic -O2 -g -D_REENTRANT $(shell pkg-config --cflags gobject-2.0) $(CFLAGS)
LDLIBS := -lpulse -lm -ldl $(shell pkg-config --libs gobject-2.0)

ponymix: ponymix.o

install: ponymix
	install -Dm755 ponymix $(DESTDIR)/usr/bin/ponymix
	install -Dm644 ponymix.1 $(DESTDIR)/usr/share/man/man1/ponymix.1

check: ponymix
	./runtests ./ponymix

clean:
	$(RM) ponymix ponymix.o
