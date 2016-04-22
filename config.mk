
# compiler and linker
CC=gcc

# flags
CPPFLAGS=-Dlinux -D_XOPEN_SOURCE=600 -D_DEFAULT_SOURCE -DUSECMS 
CFLAGS=-pipe -Os -mtune=generic -Wall -fno-strength-reduce -nodefaultlibs -fno-strict-aliasing -ffunction-sections -fdata-sections $(INCS)
LDFLAGS=-Wl,--gc-sections,--sort-common,-s $(LIBS)

# install paths 
PREFIX=/usr
LIBDIR=${PREFIX}/lib
INCDIR=${PREFIX}/include/X11

# includes and libs 
LIBS = -L/usr/lib
INCS = -I. -I../include -I../include/X11 -I../libxtrans

#If you do not have setlocale, set this:
#CPPFLAGS+= -DX_LOCALE -DXLOCALEDIR=\"/usr/share/locale\" 
KEYSYMDB=${PREFIX}/share/X11/XKeysymDB
