cmake_minimum_required(VERSION 2.8)
project(tinyX11)
add_dependencies(Xau Xext)

add_definitions(
-DXKB 
-DUNIXCONN
-DTCPCONN
-DXCMSDIR="/usr/share/X11/Xcms.txt"
-DXLOCALELIBDIR="/usr/lib/X11/locale"
)

include_directories(../include)

file(GLOB SRC "*.c")
add_library(X11 SHARED ${SRC})

set_target_properties( X11 PROPERTIES
VERSION 6.2
SOVERSION 6
)

install(TARGETS X11 DESTINATION lib)