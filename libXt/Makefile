include	../config.mk

#-DXTSTRINGDEFINES 

CPPFLAGS+= -DFUNCPROTO=15 -DNARROWPROTO -DXTHREADS -D_REENTRANT -DXUSE_MTSAFE_API -DLIBXT -DXTSTRINGDEFINES  -DXFILESEARCHPATHDEFAULT=\"/usr/lib/X11/%L/%T/%N%C%S:/usr/lib/X11/%l/%T/%N%C%S:/usr/lib/X11/%T/%N%C%S:/usr/lib/X11/%L/%T/%N%S:/usr/lib/X11/%l/%T/%N%S:/usr/lib/X11/%T/%N%S\" -DERRORDB=\"/usr/lib/X11/XtErrorDB\" -DXTERROR_PREFIX=\"\" -DXTWARNING_PREFIX=\"\" -DMALLOC_0_RETURNS_NULL -DXTMALLOC_BC -DTINY

OBJS=$(wildcard *.c)

all:	$(OBJS:.c=.o) pkgconf
	ar cr libXt.a $(OBJS:.c=.o) 
	$(CC) $(LDFLAGS) -o libXt.so.6.1~ -shared -Wl,-soname,libXt.so.6 $(OBJS:.c=.o) \
	-L../libSM -lSM -L../libICE -lICE -L../libtinyX11 -lX11
	mv -f libXt.so.6.1~ libXt.so.6.1
	test -e libXt.so.6 || ln -s libXt.so.6.1 libXt.so.6
	test -e libXt.so || ln -s libXt.so.6.1 libXt.so

pkgconf: 	
	@echo "prefix=$(PREFIX)" > xt.pc
	@echo "exec_prefix=$(PREFIX)/bin" >> xt.pc
	@echo "libdir=$(PREFIX)/lib" >> xt.pc
	@echo "includedir=$(PREFIX)/include" >> xt.pc
	@echo "" >> xt.pc
	@echo "Name: Xt" >> xt.pc
	@echo "Description: X Toolkit Library" >> xt.pc
	@echo "Version: 1.0.5" >> xt.pc
	@echo "Requires: sm ice x11 xau xdmcp" >> xt.pc
	@echo "Requires.private: sm ice x11 xau xdmcp" >> xt.pc
	@echo "Cflags: -I$(PREFIX)/include" >> xt.pc
	@echo "Libs: -L$(PREFIX)/lib -lXt" >> xt.pc
	@echo "Libs.private: -L$(PREFIX)/lib -lXt" >> xt.pc
	
clean:
	rm -f *.o *.a *.so* xt.pc
	
install:
	cp -af libXt.a $(DESTDIR)$(LIBDIR)
	cp -af libXt.so.6.1 $(DESTDIR)$(LIBDIR)
	cp -af libXt.so.6 $(DESTDIR)$(LIBDIR)
	cp -af libXt.so $(DESTDIR)$(LIBDIR)
	
depend:
	gccmakedep -- $(CFLAGS) $(CPPFLAGS) -- *.c
