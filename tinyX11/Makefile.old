include	../config.mk

#-DXOS_USE_MTSAFE_PWDAPI needed for GetDflt.c

CPPFLAGS+=-DXTHREADS -DXKB -D_POSIX_C_SOURCE=2  -DFUNCPROTO=15 -DNARROWPROTO -DMALLOC_0_RETURNS_NULL -DLIBX11 -DUNIXCONN -DTCPCONN -DTRANS_CLIENT \
 -DKEYSYMDB=\"$(KEYSYMDB)\" \
 -DXCMSDIR=\"$(XCMSDIR)\" \
 -DXLOCALELIBDIR=\"$(XLOCALELIBDIR)\" \
 -DTINY -DXOS_USE_MTSAFE_PWDAPI

OBJS=$(wildcard *.c)

#XAUOBJS=$(wildcard ../libXau/*.c)
XAUOBJS=../libXau/AuDispose.c ../libXau/AuFileName.c ../libXau/AuGetBest.c ../libXau/AuRead.c

all:	$(OBJS:.c=.o) pkgconf
	ar cr libX11.a $(OBJS:.c=.o) $(XAUOBJS:.c=.o)
	$(CC) $(LDFLAGS) -o libX11.so.6.2~ -shared -Wl,-soname,libX11.so.6.2 $(OBJS:.c=.o) $(XAUOBJS:.c=.o) \
	-L../libXext -lXext
	mv -f libX11.so.6.2~ libX11.so.6.2
	test -e libX11.so.6 || ln -sf libX11.so.6.2 libX11.so.6
	test -e libX11.so || ln -sf libX11.so.6.2 libX11.so

pkgconf:	
	@echo "prefix=$(PREFIX)" > x11.pc
	@echo "exec_prefix=$(PREFIX)/bin" >> x11.pc
	@echo "libdir=$(PREFIX)/lib" >> x11.pc
	@echo "includedir=$(PREFIX)/include" >> x11.pc
	@echo "" >> x11.pc
	@echo "xthreadlib=-lpthread" >> x11.pc
	@echo "" >> x11.pc
	@echo "Name: X11" >> x11.pc
	@echo "Description: X Library" >> x11.pc
	@echo "Version: 1.6.3" >> x11.pc
	@echo "Requires: xau xdmcp " >> x11.pc
	@echo "Requires.private: xau xdmcp " >> x11.pc
	@echo "Cflags: -I$(PREFIX)/include" >> x11.pc
	@echo "Libs: -L$(PREFIX)/lib -lX11" >> x11.pc
	@echo "Libs.private: -L$(PREFIX)/lib -lX11 -lpthread" >> x11.pc
	
#KeysymStr.o:	KeysymStr.c ks_tables.h
#makekeys:	makekeys.o
#	$(CC) $(LDFLAGS) -o makekeys makekeys.o
#ks_tables.h:	makekeys
#	./makekeys < ../include/X11/keysymdef.h >ks_tables.h

transport.o:	transport.c xtrans/Xtranssock.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) transport.c
	
clean:
	rm -f *.o *.a *.so* x11.pc	
#rm -f makekeys 
	
install:
	cp -af libX11.a $(DESTDIR)$(LIBDIR)
	cp -af libX11.so.6.2 $(DESTDIR)$(LIBDIR)
	cp -af libX11.so.6 $(DESTDIR)$(LIBDIR)
	cp -af libX11.so $(DESTDIR)$(LIBDIR)
	cp -a XKeysymDB $(DESTDIR)$(KEYSYMDB)
	
depend:
	gccmakedep -- $(CFLAGS) $(CPPFLAGS) -- *.c
