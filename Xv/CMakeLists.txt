cmake_minimum_required(VERSION 2.8)
project(Xv)

include_directories(../include)

add_library(Xv SHARED Xv.c)

set_target_properties(Xv PROPERTIES
VERSION 1.0
SOVERSION 1
)
install(TARGETS Xv DESTINATION lib)