include	../config.mk

CPPFLAGS=-D_POSIX_C_SOURCE=2  -DFUNCPROTO=15 -DNARROWPROTO

OBJS=$(wildcard *.c)

all:	$(OBJS:.c=.o) 
	ar cr libXdmcp.a $(OBJS:.c=.o)
	$(CC) $(LDFLAGS) -o libXdmcp.so.6.0~ -shared -Wl,-soname,libXdmcp.so.6 $(OBJS:.c=.o)
	mv -f libXdmcp.so.6.0~ libXdmcp.so.6.0
	test -e libXdmcp.so.6 || ln -s libXdmcp.so.6.0 libXdmcp.so.6
	test -e libXdmcp.so || ln -s libXdmcp.so.6.0 libXdmcp.so

pkgconf:	
	@echo "prefix=$(PREFIX)" > xdmcp.pc
	@echo "exec_prefix=$(PREFIX)/bin" >> xdmcp.pc
	@echo "libdir=$(PREFIX)/lib" >> xdmcp.pc
	@echo "includedir=$(PREFIX)/include" >> xdmcp.pc
	@echo "" >> xdmcp.pc
	@echo "Name: Xdmcp" >> xdmcp.pc
	@echo "Description: X Display Manager Control Protocol library" >> xdmcp.pc
	@echo "Version: 1.1.2" >> xdmcp.pc
	@echo "Requires:" >> xdmcp.pc
	@echo "Requires.private: " >> xdmcp.pc
	@echo "Cflags: -I$(PREFIX)/include" >> xdmcp.pc
	@echo "Libs: -L$(PREFIX)/lib -lXdmcp" >> xdmcp.pc
	@echo "Libs.private: -L$(PREFIX)/lib -lXdmcp" >> xdmcp.pc
	
clean:
	rm -f *.o *.a *.so* xdmcp.pc
	
install:	libXdmcp.a libXdmcp.so.6.0 libXdmcp.so.6 libXdmcp.so
	cp -af libXdmcp.a $(DESTDIR)$(LIBDIR)
	cp -af libXdmcp.so.6.0 $(DESTDIR)$(LIBDIR)
	cp -af libXdmcp.so.6 $(DESTDIR)$(LIBDIR)
	cp -af libXdmcp.so $(DESTDIR)$(LIBDIR)
	
depend:
	gccmakedep -- $(CFLAGS) -- *.c
