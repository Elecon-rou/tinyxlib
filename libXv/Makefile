include	../config.mk

#DEFS=-DX11_t -DTRANS_CLIENT

CPPFLAGS= -DFUNCPROTO=15 -DNARROWPROTO -DXTHREADS -D_REENTRANT -DXUSE_MTSAFE_API -DMALLOC_0_RETURNS_NULL

OBJS=$(wildcard *.c)

all:	$(OBJS:.c=.o) 
	ar cr libXv.a $(OBJS:.c=.o) 
	$(CC) $(LDFLAGS) -o libXv.so.1.0~ -shared -Wl,-soname,libXv.so.1 $(OBJS:.c=.o)
	mv -f libXv.so.1.0~ libXv.so.1.0
	test -e libXv.so.1 || ln -s libXv.so.1.0 libXv.so.1
	test -e libXv.so || ln -s libXv.so.1.0 libXv.so	
	
clean:
	rm -f *.o *.a *.so*
	
install:
	cp -af libXv.a $(DESTDIR)$(LIBDIR)
	cp -af libXv.so.1.0 $(DESTDIR)$(LIBDIR)
	cp -af libXv.so.1 $(DESTDIR)$(LIBDIR)
	cp -af libXv.so $(DESTDIR)$(LIBDIR)
	
depend:
	gccmakedep -- $(CFLAGS) $(CPPFLAGS) -- *.c
