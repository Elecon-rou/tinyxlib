include	../config.mk

CPPFLAGS+= -DFUNCPROTO=15 -DNARROWPROTO -DXTHREADS -D_REENTRANT -DXUSE_MTSAFE_API -DXTSTRINGDEFINES -DUNIXCONN -DTCPCONN -DHAS_STICKY_DIR_BIT -DIPv6 -DBITMAPDIR=\"/usr/include/X11/bitmaps\" -DTINY

OBJS=$(wildcard *.c)

all:	$(OBJS:.c=.o)  pkgconf
	ar cr libXmu.a $(OBJS:.c=.o) 
	$(CC) $(LDFLAGS) -o libXmu.so.6.2~ -shared -Wl,-soname,libXmu.so.6 $(OBJS:.c=.o) \
	-L../libXt -lXt
	mv -f libXmu.so.6.2~ libXmu.so.6.2
	test -e libXmu.so.6 || ln -s libXmu.so.6.2 libXmu.so.6
	test -e libXmu.so || ln -s libXmu.so.6.2 libXmu.so	

pkgconf:	
	@echo "prefix=$(PREFIX)" > xmu.pc
	@echo "exec_prefix=$(PREFIX)/bin" >> xmu.pc
	@echo "libdir=$(PREFIX)/lib" >> xmu.pc
	@echo "includedir=$(PREFIX)/include" >> xmu.pc
	@echo "" >> xmu.pc
	@echo "Name: Xmu" >> xmu.pc
	@echo "Description: Xmu Library" >> xmu.pc
	@echo "Version: 1.0.3" >> xmu.pc
	@echo "Requires: xt sm ice xext x11 xau xdmcp" >> xmu.pc
	@echo "Requires.private: xt sm ice xext x11 xau xdmcp" >> xmu.pc
	@echo "Cflags: -I$(PREFIX)/include" >> xmu.pc
	@echo "Libs: -L$(PREFIX)/lib -lXmu" >> xmu.pc
	@echo "Libs.private: -L$(PREFIX)/lib -lXmu" >> xmu.pc
	
clean:
	rm -f *.o *.a *.so* xmu.pc
	
install:
	cp -af libXmu.a $(DESTDIR)$(LIBDIR)
	cp -af libXmu.so.6.2 $(DESTDIR)$(LIBDIR)
	cp -af libXmu.so.6 $(DESTDIR)$(LIBDIR)
	cp -af libXmu.so $(DESTDIR)$(LIBDIR)
	
depend:
	gccmakedep -- $(CFLAGS) $(CPPFLAGS) -- *.c
