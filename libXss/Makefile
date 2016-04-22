include	../config.mk

#CPPFLAGS=-DICE_t -DTRANS_CLIENT

CPPFLAGS+= -DFUNCPROTO=15 -DNARROWPROTO -DXTHREADS -D_REENTRANT -DXUSE_MTSAFE_API -DUNIXCONN -DTCPCONN -DHAS_STICKY_DIR_BIT -DIPv6 -DICE_t

OBJS=$(wildcard *.c)

all:	$(OBJS:.c=.o) 
	ar cr libXss.a $(OBJS:.c=.o) 
	$(CC) $(LDFLAGS) -o libXss.so.1.0~ -shared -Wl,-soname,libXss.so.6 $(OBJS:.c=.o) 
	mv -f libXss.so.1.0~ libXss.so.1.0
	test -e libXss.so.1 || ln -s libXss.so.1.0 libXss.so.1
	test -e libXss.so || ln -s libXss.so.1.0 libXss.so
	
clean:
	rm -f *.o *.a *.so*
	
install:
	cp -af libXss.a $(DESTDIR)$(LIBDIR)
	cp -af libXss.so.1.0 $(DESTDIR)$(LIBDIR)
	cp -af libXss.so.1 $(DESTDIR)$(LIBDIR)
	cp -af libXss.so $(DESTDIR)$(LIBDIR)
	
depend:
	gccmakedep -- $(CFLAGS) -- *.c
