include	../config.mk

CPPFLAGS+=-D_POSIX_C_SOURCE=2 -D_SVID_SOURCE -DFUNCPROTO=15 -DNARROWPROTO

OBJS=$(wildcard *.c)

all:	$(OBJS:.c=.o) pkgconf
	ar cr libXcursor.a $(OBJS:.c=.o) 
	$(CC) $(LDFLAGS) -o libXcursor.so.6.0~ -shared -Wl,-soname,libXcursor.so.6 $(OBJS:.c=.o)
	mv -f libXcursor.so.6.0~ libXcursor.so.6.0
	test -e libXcursor.so.6 || ln -s libXcursor.so.6.0 libXcursor.so.6
	test -e libXcursor.so || ln -s libXcursor.so.6.0 libXcursor.so

pkgconf:	
	@echo "prefix=$(PREFIX)" > xcursor.pc
	@echo "exec_prefix=$(PREFIX)/bin" >> xcursor.pc
	@echo "libdir=$(PREFIX)/lib" >> xcursor.pc
	@echo "includedir=$(PREFIX)/include" >> xcursor.pc
	@echo "" >> xcursor.pc
	@echo "Name: Xcursor" >> xcursor.pc
	@echo "Description: X Cursor library" >> xcursor.pc
	@echo "Version: .0" >> xcursor.pc
	@echo "Requires:" >> xcursor.pc
	@echo "Requires.private:" >> xcursor.pc
	@echo "Cflags: -I$(PREFIX)/include" >> xcursor.pc
	@echo "Libs: -L$(PREFIX)/lib -lXcursor" >> xcursor.pc
	@echo "Libs.private: -L$(PREFIX)/lib -lXcursor" >> xcursor.pc
	
clean:
	rm -f *.o *.a *.so* xcursor.pc
	
install:	
	cp -af libXcursor.a $(DESTDIR)$(LIBDIR)
	cp -af libXcursor.so.6.0 $(DESTDIR)$(LIBDIR)
	cp -af libXcursor.so.6 $(DESTDIR)$(LIBDIR)
	cp -af libXcursor.so $(DESTDIR)$(LIBDIR)
	
depend:
	gccmakedep -- $(CFLAGS) -- *.c
