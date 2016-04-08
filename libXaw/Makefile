include	../config.mk

CPPFLAGS=-DNOERROR -D_SVID_SOURCE -DFUNCPROTO=15 -DNARROWPROTO -DHAS_WCHAR_H -DHAS_WCTYPE_H -DNO_WIDEC_H -DPROJECT_ROOT=\"/usr\" -DXTHREADS -D_REENTRANT -DXUSE_MTSAFE_API -DUNIXCONN -DTCPCONN -DHAS_STICKY_DIR_BIT -DIPv6 -DICE_t 

OBJS=$(wildcard *.c)

all:	$(OBJS:.c=.o)  pkgconf
	ar cr libXaw.a $(OBJS:.c=.o) 
	$(CC) $(LDFLAGS) -o libXaw.so.7.1~ -shared -Wl,-soname,libXaw.so.7 $(OBJS:.c=.o) \
	-L../libXpm -lXpm -L../libXmu -lXmu 
	mv -f libXaw.so.7.1~ libXaw.so.7.1
	test -e libXaw.so.7 || ln -s libXaw.so.7.1 libXaw.so.7
	test -e libXaw.so || ln -s libXaw.so.7.1 libXaw.so

pkgconf:	
	@echo "prefix=$(PREFIX)" > xaw7.pc
	@echo "exec_prefix=$(PREFIX)/bin" >> xaw7.pc
	@echo "libdir=$(PREFIX)/lib" >> xaw7.pc
	@echo "includedir=$(PREFIX)/include" >> xaw7.pc
	@echo "" >> xaw7.pc
	@echo "Name: Xaw" >> xaw7.pc
	@echo "Description: X Athena Widgets Library, version 7" >> xaw7.pc
	@echo "Version: 1.0.4" >> xaw7.pc
	@echo "Requires: xpm xproto xt xmu" >> xaw7.pc
	@echo "Requires.private: xpm xt xmu xext x11" >> xaw7.pc
	@echo "Cflags: -I$(PREFIX)/include" >> xaw7.pc
	@echo "Libs: -L$(PREFIX)/lib -lXaw" >> xaw7.pc
	@echo "Libs.private: -L$(PREFIX)/lib -lXaw" >> xaw7.pc	
	
clean:
	rm -f *.o *.a *.so* xaw7.pc
	
install:
	cp -af libXaw.a $(DESTDIR)$(LIBDIR)
	cp -af libXaw.so.7.1 $(DESTDIR)$(LIBDIR)
	cp -af libXaw.so.7 $(DESTDIR)$(LIBDIR)
	cp -af libXaw.so $(DESTDIR)$(LIBDIR)
	
depend:
	gccmakedep -- $(CFLAGS) -- *.c
