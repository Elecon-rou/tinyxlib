include	../config.mk

CPPFLAGS+= -DFUNCPROTO=15 -DNARROWPROTO -DXTHREADS -D_REENTRANT -DXUSE_MTSAFE_API -DUNIXCONN -DTCPCONN -DHAS_STICKY_DIR_BIT -DIPv6 -DICE_t

OBJS=$(wildcard *.c)

all:	$(OBJS:.c=.o) pkgconf
	ar cr libXfixes.a $(OBJS:.c=.o) 
	$(CC) $(LDFLAGS) -o libXfixes.so.3.0~ -shared -Wl,-soname,libXfixes.so.3 $(OBJS:.c=.o) 
	mv -f libXfixes.so.3.0~ libXfixes.so.3.0
	test -e libXfixes.so.3 || ln -s libXfixes.so.3.0 libXfixes.so.3
	test -e libXfixes.so || ln -s libXfixes.so.3.0 libXfixes.so

pkgconf:	
	@echo "prefix=$(PREFIX)" > xfixes.pc
	@echo "exec_prefix=$(PREFIX)/bin" >> xfixes.pc
	@echo "libdir=$(PREFIX)/lib" >> xfixes.pc
	@echo "includedir=$(PREFIX)/include" >> xfixes.pc
	@echo "" >> xfixes.pc
	@echo "Name: Xfixes" >> xfixes.pc
	@echo "Description: X Fixes  Library" >> xfixes.pc
	@echo "Version: 4.0.3" >> xfixes.pc
	@echo "Requires: x11" >> xfixes.pc
	@echo "Requires.private: x11" >> xfixes.pc
	@echo "Cflags: -I$(PREFIX)/include" >> xfixes.pc
	@echo "Libs: -L$(PREFIX)/lib -lXfixes" >> xfixes.pc
	@echo "Libs.private: -L$(PREFIX)/lib -lXfixes" >> xfixes.pc
	
clean:
	rm -f *.o *.a *.so* xfixes.pc
	
install:
	cp -af libXfixes.a $(DESTDIR)$(LIBDIR)
	cp -af libXfixes.so.3.0 $(DESTDIR)$(LIBDIR)
	cp -af libXfixes.so.3 $(DESTDIR)$(LIBDIR)
	cp -af libXfixes.so $(DESTDIR)$(LIBDIR)
	
depend:
	gccmakedep -- $(CFLAGS) -- *.c
