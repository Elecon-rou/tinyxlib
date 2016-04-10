include	../config.mk

CPPFLAGS+=-D_POSIX_C_SOURCE=2 -D_SVID_SOURCE -DFUNCPROTO=15 -DNARROWPROTO

OBJS=$(wildcard *.c)

all:	$(OBJS:.c=.o) pkgconf
	ar cr libXau.a $(OBJS:.c=.o)
	$(CC) $(LDFLAGS) -o libXau.so.6.0~ -shared -Wl,-soname,libXau.so.6 $(OBJS:.c=.o)
	mv -f libXau.so.6.0~ libXau.so.6.0
	test -e libXau.so.6 || ln -s libXau.so.6.0 libXau.so.6
	test -e libXau.so || ln -s libXau.so.6.0 libXau.so
pkgconf:
	@echo "prefix=$(PREFIX)" > xau.pc
	@echo "exec_prefix=$(PREFIX)/bin" >> xau.pc
	@echo "libdir=$(PREFIX)/lib" >> xau.pc
	@echo "includedir=$(PREFIX)/include" >> xau.pc
	@echo "" >> xau.pc
	@echo "Name: Xau" >> xau.pc
	@echo "Description: X authorization file management libary" >> xau.pc
	@echo "Version: 1.0.8" >> xau.pc
	@echo "Requires:" >> xau.pc
	@echo "Requires.private:" >> xau.pc
	@echo "Cflags: -I$(PREFIX)/include" >> xau.pc
	@echo "Libs: -L$(PREFIX)/lib -lXau" >> xau.pc
	@echo "Libs.private: -L$(PREFIX)/lib -lXau" >> xau.pc
clean:
	rm -f *.o *.a *.so* xau.pc

install:
	cp -af libXau.a $(DESTDIR)$(LIBDIR)
	cp -af libXau.so.6.0 $(DESTDIR)$(LIBDIR)
	cp -af libXau.so.6 $(DESTDIR)$(LIBDIR)
	cp -af libXau.so $(DESTDIR)$(LIBDIR)

depend:
	gccmakedep -- $(CFLAGS) $(CPPFLAGS) -- *.c
