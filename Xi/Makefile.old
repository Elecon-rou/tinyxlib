include	../config.mk

CPPFLAGS=-DICE_t -DTRANS_CLIENT 

OBJS=$(wildcard *.c)

all:	$(OBJS:.c=.o) 
	ar cr libXi.a $(OBJS:.c=.o) 
	$(CC) $(LDFLAGS) -o libXi.so.6.0~ -shared -Wl,-soname,libXi.so.6 $(OBJS:.c=.o) 
	mv -f libXi.so.6.0~ libXi.so.6.0
	test -e libXi.so.6 || ln -s libXi.so.6.0 libXi.so.6
	test -e libXi.so || ln -s libXi.so.6.0 libXi.so	
	
clean:
	rm -f *.o *.a *.so*
	
install:
	cp -af libXi.a $(DESTDIR)$(LIBDIR)
	cp -af libXi.so.6.0 $(DESTDIR)$(LIBDIR)
	cp -af libXi.so.6 $(DESTDIR)$(LIBDIR)
	cp -af libXi.so $(DESTDIR)$(LIBDIR)
	
depend:
	gccmakedep -- $(CFLAGS) -- *.c