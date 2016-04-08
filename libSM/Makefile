include	../config.mk

CPPFLAGS+=-D_SVID_SOURCE -DFUNCPROTO=15 -DNARROWPROTO -DXTHREADS -D_REENTRANT -DXUSE_MTSAFE_API -DUNIXCONN -DTCPCONN -DHAS_STICKY_DIR_BIT -DIPv6 -DICE_t

OBJS=$(wildcard *.c)

all:	$(OBJS:.c=.o) pkgconf
	ar cr libSM.a $(OBJS:.c=.o) 
	$(CC) $(LDFLAGS) -o libSM.so.6.0~ -shared -Wl,-soname,libSM.so.6 $(OBJS:.c=.o) 
	mv -f libSM.so.6.0~ libSM.so.6.0
	test -e libSM.so.6 || ln -s libSM.so.6.0 libSM.so.6
	test -e libSM.so || ln -s libSM.so.6.0 libSM.so	

pkgconf:	
	@echo "prefix=$(PREFIX)" > sm.pc
	@echo "exec_prefix=$(PREFIX)/bin" >> sm.pc
	@echo "libdir=$(PREFIX)/lib" >> sm.pc
	@echo "includedir=$(PREFIX)/include" >> sm.pc
	@echo "" >> sm.pc
	@echo "Name: SM" >> sm.pc
	@echo "Description: X Session Management Library" >> sm.pc
	@echo "Version: 1.0.3" >> sm.pc
	@echo "Requires: ice" >> sm.pc
	@echo "Requires.private: ice" >> sm.pc
	@echo "Cflags: -I$(PREFIX)/include" >> sm.pc
	@echo "Libs: -L$(PREFIX)/lib -lSM" >> sm.pc
	@echo "Libs.private: -L$(PREFIX)/lib -lSM" >> sm.pc
	
clean:
	rm -f *.o *.a *.so* sm.pc
	
install:
	cp -af libSM.a $(DESTDIR)$(LIBDIR)
	cp -af libSM.so.6.0 $(DESTDIR)$(LIBDIR)
	cp -af libSM.so.6 $(DESTDIR)$(LIBDIR)
	cp -af libSM.so $(DESTDIR)$(LIBDIR)
	
depend:
	gccmakedep -- $(CFLAGS) $(CPPFLAGS) -- *.c
