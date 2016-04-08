include	../config.mk

#CPPFLAGS+=-DICE_t -DTRANS_CLIENT 

CPPFLAGS+=-D_SVID_SOURCE -DFUNCPROTO=15 -DNARROWPROTO -DUNIXCONN -DTCPCONN -DHAS_STICKY_DIR_BIT -DIPv6 -DICE_t -DTRANS_CLIENT -DTRANS_SERVER

OBJS=$(wildcard *.c)

all:	$(OBJS:.c=.o) pkgconf
	ar cr libICE.a $(OBJS:.c=.o) 
	$(CC) $(LDFLAGS) -o libICE.so.6.3~ -shared -Wl,-soname,libICE.so.6 $(OBJS:.c=.o) 
	mv -f libICE.so.6.3~ libICE.so.6.3
	test -e libICE.so.6 || ln -s libICE.so.6.3 libICE.so.6
	test -e libICE.so || ln -s libICE.so.6.3 libICE.so

pkgconf:	
	@echo "prefix=$(PREFIX)" > ice.pc
	@echo "exec_prefix=$(PREFIX)/bin" >> ice.pc
	@echo "libdir=$(PREFIX)/lib" >> ice.pc
	@echo "includedir=$(PREFIX)/include" >> ice.pc
	@echo "" >> ice.pc
	@echo "Name: ICE" >> ice.pc
	@echo "Description: X Inter Client Exchange Library" >> ice.pc
	@echo "Version: 1.0.4" >> ice.pc
	@echo "Requires: x11" >> ice.pc
	@echo "Requires.private: x11" >> ice.pc
	@echo "Cflags: -I$(PREFIX)/include" >> ice.pc
	@echo "Libs: -L$(PREFIX)/lib -lICE" >> ice.pc
	@echo "Libs.private: -L$(PREFIX)/lib -lICE" >> ice.pc		
	
clean:
	rm -f *.o *.a *.so* ice.pc
	
install:
	cp -af libICE.a $(DESTDIR)$(LIBDIR)
	cp -af libICE.so.6.3 $(DESTDIR)$(LIBDIR)
	cp -af libICE.so.6 $(DESTDIR)$(LIBDIR)
	cp -af libICE.so $(DESTDIR)$(LIBDIR)
	
depend:
	gccmakedep -- $(CFLAGS) $(CPPFLAGS) -- *.c