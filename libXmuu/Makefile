include	../config.mk

CPPFLAGS+= -DFUNCPROTO=15 -DNARROWPROTO -DXTHREADS -D_REENTRANT -DXUSE_MTSAFE_API -DXTSTRINGDEFINES -DUNIXCONN -DTCPCONN -DHAS_STICKY_DIR_BIT -DIPv6 -DBITMAPDIR=\"/usr/include/X11/bitmaps\" -DTINY

OBJS=$(wildcard *.c)

all:	$(OBJS:.c=.o) pkgconf
	ar cr libXmuu.a $(OBJS:.c=.o) 
	$(CC) $(LDFLAGS) -o libXmuu.so.1.0~ -shared -Wl,-soname,libXmuu.so.1 $(OBJS:.c=.o)
	mv -f libXmuu.so.1.0~ libXmuu.so.1.0
	test -e libXmuu.so.1 || ln -s libXmuu.so.1.0 libXmuu.so.1
	test -e libXmuu.so || ln -s libXmuu.so.1.0 libXmuu.so	

pkgconf:	
	@echo "prefix=$(PREFIX)" > xmuu.pc
	@echo "exec_prefix=$(PREFIX)/bin" >> xmuu.pc
	@echo "libdir=$(PREFIX)/lib" >> xmuu.pc
	@echo "includedir=$(PREFIX)/include" >> xmuu.pc
	@echo "" >> xmuu.pc
	@echo "Name: Xmuu" >> xmuu.pc
	@echo "Description: Mini Xmu Library" >> xmuu.pc
	@echo "Version: 1.0.3" >> xmuu.pc
	@echo "Requires: x11 xau xdmcp" >> xmuu.pc
	@echo "Requires.private: x11 xau xdmcp" >> xmuu.pc
	@echo "Cflags: -I$(PREFIX)/include" >> xmuu.pc
	@echo "Libs: -L$(PREFIX)/lib -lXmuu" >> xmuu.pc
	@echo "Libs.private: -L$(PREFIX)/lib -lXmuu" >> xmuu.pc
	
clean:
	rm -f *.o *.a *.so* xmuu.pc
	
install:
	cp -af libXmuu.a $(DESTDIR)$(LIBDIR)
	cp -af libXmuu.so.1.0 $(DESTDIR)$(LIBDIR)
	cp -af libXmuu.so.1 $(DESTDIR)$(LIBDIR)
	cp -af libXmuu.so $(DESTDIR)$(LIBDIR)
	
depend:
	gccmakedep -- $(CFLAGS) -- *.c
