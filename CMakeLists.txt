cmake_minimum_required(VERSION 2.8)

project(tinyxlib)

set(SUBDIRS
Xi 
Xau 
Xcursor
Xdmcp
Xext
Xfixes
Xfont
Xinerama
Xmu
Xmuu
Xpm
Xrender
Xss
Xt
Xtst
Xv
SM
ICE
tinyX11
)

foreach(subdir ${SUBDIRS})
  add_subdirectory(${subdir})
endforeach()

install(DIRECTORY include DESTINATION .)