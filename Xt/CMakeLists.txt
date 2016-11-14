cmake_minimum_required(VERSION 2.8)
project(Xt)

include_directories(../include ../include/X11)

file(GLOB SRC "*.c")
add_library(Xt SHARED ${SRC})

set_target_properties(Xt PROPERTIES
VERSION 6.1
SOVERSION 6
)
install(TARGETS Xt DESTINATION lib)