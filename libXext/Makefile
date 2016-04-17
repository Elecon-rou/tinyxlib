include	../config.mk

CPPFLAGS+=-DNOERROR -D_SVID_SOURCE -DFUNCPROTO=15 -DNARROWPROTO -DXTHREADS -D_REENTRANT -DXUSE_MTSAFE_API -DMALLOC_0_RETURNS_NULL

OBJS=$(wildcard *.c)

all:	$(OBJS:.c=.o) pkgconf
	ar cr libXext.a $(OBJS:.c=.o) 
	$(CC) $(LDFLAGS) -o libXext.so.6.5~ -shared -Wl,-soname,libXext.so.6 $(OBJS:.c=.o)
	mv -f libXext.so.6.5~ libXext.so.6.5
	test -e libXext.so.6 || ln -s libXext.so.6.5 libXext.so.6
	test -e libXext.so || ln -s libXext.so.6.5 libXext.so	

pkgconf:	
	@echo "prefix=$(PREFIX)" > xext.pc
	@echo "exec_prefix=$(PREFIX)/bin" >> xext.pc
	@echo "libdir=$(PREFIX)/lib" >> xext.pc
	@echo "includedir=$(PREFIX)/include" >> xext.pc
	@echo "" >> xext.pc
	@echo "Name: Xext" >> xext.pc
	@echo "Description: Misc X Extension Library" >> xext.pc
	@echo "Version: 1.3.3" >> xext.pc
	@echo "Requires: x11 xau xdmcp" >> xext.pc
	@echo "Requires.private: x11 xau xdmcp" >> xext.pc
	@echo "Cflags: -I$(PREFIX)/include" >> xext.pc
	@echo "Libs: -L$(PREFIX)/lib -lXext" >> xext.pc
	@echo "Libs.private: -L$(PREFIX)/lib -lXext" >> xext.pc
	
clean:
	rm -f *.o *.a *.so* xext.pc
	
install:
	cp -af libXext.a $(DESTDIR)$(LIBDIR)
	cp -af libXext.so.6.5 $(DESTDIR)$(LIBDIR)
	cp -af libXext.so.6 $(DESTDIR)$(LIBDIR)
	cp -af libXext.so $(DESTDIR)$(LIBDIR)
	
depend:
	gccmakedep -- $(CFLAGS) $(CPPFLAGS) -- *.c
