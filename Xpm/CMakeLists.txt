cmake_minimum_required(VERSION 2.8)
project(Xpm)

include_directories(../include)

file(GLOB SRC "*.c")
add_library(Xpm SHARED ${SRC})

set_target_properties(Xpm PROPERTIES
VERSION 1.0
SOVERSION 1
)
install(TARGETS Xpm DESTINATION lib)