include	../config.mk

CPPFLAGS+=-DICE_t -DTRANS_CLIENT

OBJS=$(wildcard *.c)

all:	$(OBJS:.c=.o) pkgconf
	ar cr libXpm.a $(OBJS:.c=.o) 
	$(CC) $(LDFLAGS) -o libXpm.so.1.0~ -shared -Wl,-soname,libXpm.so.1 $(OBJS:.c=.o) 
	mv -f libXpm.so.1.0~ libXpm.so.1.0
	test -e libXpm.so.1 || ln -s libXpm.so.1.0 libXpm.so.1
	test -e libXpm.so || ln -s libXpm.so.1.0 libXpm.so

pkgconf:	
	@echo "prefix=$(PREFIX)" > xpm.pc
	@echo "exec_prefix=$(PREFIX)/bin" >> xpm.pc
	@echo "libdir=$(PREFIX)/lib" >> xpm.pc
	@echo "includedir=$(PREFIX)/include" >> xpm.pc
	@echo "" >> xpm.pc
	@echo "Name: Xpm" >> xpm.pc
	@echo "Description: X Pixmap Library" >> xpm.pc
	@echo "Version: 3.5.11" >> xpm.pc
	@echo "Requires: x11" >> xpm.pc
	@echo "Requires.private: x11" >> xpm.pc
	@echo "Cflags: -I$(PREFIX)/include" >> xpm.pc
	@echo "Libs: -L$(PREFIX)/lib -lXpm" >> xpm.pc
	@echo "Libs.private: -L$(PREFIX)/lib -lXpm" >> xpm.pc
	
clean:
	rm -f *.o *.a *.so* xpm.pc
	
install:
	cp -af libXpm.a $(DESTDIR)$(LIBDIR)
	cp -af libXpm.so.1.0 $(DESTDIR)$(LIBDIR)
	cp -af libXpm.so.1 $(DESTDIR)$(LIBDIR)
	cp -af libXpm.so $(DESTDIR)$(LIBDIR)
	
depend:
	gccmakedep -- $(CFLAGS) $(CPPFLAGS) -- *.c