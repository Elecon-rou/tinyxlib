DIRS = libXau libICE libSM libXext libtinyX11 libXt\
libXmu libXv libXinerama libXrender libXpm libXtst libXfont\
libXdmcp libXi libXmuu libXss libXfixes libXcursor

all: $(DIRS)
	for dir in $^; do \
	cd $$dir; make; cd ..;\
	done

clean: 
	rm -f lib*/*.o
	rm -f lib*/*.a
	rm -f lib*/*.so
	rm -f lib*/*.pc

install: $(DIRS)
	for dir in $^; do \
	cd $$dir; make install; cd ..;\
	done
