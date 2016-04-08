include	../config.mk

#CPPFLAGS+=-DX11_t -DTRANS_CLIENT

CPPFLAGS+=-D_SVID_SOURCE -DFUNCPROTO=15 -DNARROWPROTO -DXTHREADS -D_REENTRANT -DXUSE_MTSAFE_API -DMALLOC_0_RETURNS_NULL

OBJS=$(wildcard *.c)

all:	$(OBJS:.c=.o) 
	ar cr libXinerama.a $(OBJS:.c=.o) 
	$(CC) $(LDFLAGS) -o libXinerama.so.1.0~ -shared -Wl,-soname,libXinerama.so.1 $(OBJS:.c=.o) 
	mv -f libXinerama.so.1.0~ libXinerama.so.1.0
	test -e libXinerama.so.1 || ln -s libXinerama.so.1.0 libXinerama.so.1
	test -e libXinerama.so || ln -s libXinerama.so.1.0 libXinerama.so
	
clean:
	rm -f *.o *.a *.so*
	
install:
	cp -af libXinerama.a $(DESTDIR)$(LIBDIR)
	cp -af libXinerama.so.1.0 $(DESTDIR)$(LIBDIR)
	cp -af libXinerama.so.1 $(DESTDIR)$(LIBDIR)
	cp -af libXinerama.so $(DESTDIR)$(LIBDIR)
	
depend:
	gccmakedep -- $(CFLAGS) $(CPPFLAGS) -- *.c
