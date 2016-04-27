include	../config.mk

CPPFLAGS+=-D_POSIX_C_SOURCE=2  

OBJS=$(wildcard *.c)

all:	$(OBJS:.c=.o) pkgconf
	ar cr libXtst.a $(OBJS:.c=.o) 
	$(CC) $(LDFLAGS) -o libXtst.so.6.1~ -shared -Wl,-soname,libXtst.so.6 $(OBJS:.c=.o)
	mv -f libXtst.so.6.1~ libXtst.so.6.1
	test -e libXtst.so.6 || ln -s libXtst.so.6.1 libXtst.so.6
	test -e libXtst.so || ln -s libXtst.so.6.1 libXtst.so

pkgconf:	
	@echo "prefix=$(PREFIX)" > xtst.pc
	@echo "exec_prefix=$(PREFIX)/bin" >> xtst.pc
	@echo "libdir=$(PREFIX)/lib" >> xtst.pc
	@echo "includedir=$(PREFIX)/include" >> xtst.pc
	@echo "" >> xtst.pc
	@echo "Name: Xtst" >> xtst.pc
	@echo "Description: The Xtst Library" >> xtst.pc
	@echo "Version: 1.2.2" >> xtst.pc
	@echo "Requires: xx11 xext" >> xtst.pc
	@echo "Requires.private: x11 xext" >> xtst.pc
	@echo "Cflags: -I$(PREFIX)/include" >> xtst.pc
	@echo "Libs: -L$(PREFIX)/lib -lXtst" >> xtst.pc
	@echo "Libs.private: -L$(PREFIX)/lib -lXtst" >> xtst.pc
	
clean:
	rm -f *.o *.a *.so* xtst.pc
	
install:
	cp -af libXtst.a $(DESTDIR)$(LIBDIR)
	cp -af libXtst.so.6.1 $(DESTDIR)$(LIBDIR)
	cp -af libXtst.so.6 $(DESTDIR)$(LIBDIR)
	cp -af libXtst.so $(DESTDIR)$(LIBDIR)
	
depend:
	gccmakedep -- $(CFLAGS) $(CPPFLAGS) -- *.c
