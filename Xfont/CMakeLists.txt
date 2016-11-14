cmake_minimum_required(VERSION 2.8)
project(Xfont)

find_package(Freetype REQUIRED)

include_directories(../include ./stubs ${FREETYPE_INCLUDE_DIRS})

add_definitions(-DFONT_ENCODINGS_DIRECTORY="/usr/share/X11/fonts/encodings")

file(GLOB SRC 
"bitmap/*.c"
"builtins/*.c"
"fc/*.c"
"fontenc/*.c"
"fontfile/*.c"
"FreeType/*.c"
"stubs/*.c"
"util/*.c"
)

add_library(Xfont SHARED ${SRC})

set_target_properties(Xfont PROPERTIES
VERSION 6.0
SOVERSION 6
)
install(TARGETS Xfont DESTINATION lib)