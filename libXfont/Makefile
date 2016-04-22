include	../config.mk

CPPFLAGS+=-D_POSIX_C_SOURCE=2  -DFUNCPROTO=15 -DNARROWPROTO -DFONTDIRATTRIB -DFONT_ENCODINGS_DIRECTORY=\"/usr/X11R7/lib/X11/fonts/encodings/encodings.dir\" -DPCFFORMAT -DX_GZIP_FONT_COMPRESSION -DUNIXCONN -DTCPCONN -DHAS_STICKY_DIR_BIT -DFONT_t -DTRANS_CLIENT -DTRANS_SERVER -DTRANS_REOPEN -DSHAPE -DTOGCUP -DKDRIVESERVER -DGCCUSESGAS -DDDXOSINIT -DSMART_SCHEDULE -DNOFONTSERVERACCESS -DNDEBUG -DFONTCACHE

CFLAGS+= -I./include

OBJS=$(wildcard bitmap/*.c fontfile/*.c fontcache/*.c fc/*.c  util/*.c stubs/*.c)

all:	$(OBJS:.c=.o) 
	ar cr libXfont.a $(OBJS:.c=.o) 
	$(CC) $(LDFLAGS) -o libXfont.so.6.0~ -shared -Wl,-soname,libXfont.so.6 $(OBJS:.c=.o) 
	mv -f libXfont.so.6.0~ libXfont.so.6.0
	test -e libXfont.so.6 || ln -s libXfont.so.6.0 libXfont.so.6
	test -e libXfont.so || ln -s libXfont.so.6.0 libXfont.so
	
clean:
	rm -f bitmap/*.o fontfile/*.o fontcache/*.o fc/*.o  util/*.o stubs/*.o *.a *.so*
	
install:
	cp -af libXfont.a $(DESTDIR)$(LIBDIR)
	cp -af libXfont.so.6.0 $(DESTDIR)$(LIBDIR)
	cp -af libXfont.so.6 $(DESTDIR)$(LIBDIR)
	cp -af libXfont.so $(DESTDIR)$(LIBDIR)
	
depend:
	gccmakedep -- $(CFLAGS) -- *.c
