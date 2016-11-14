cmake_minimum_required(VERSION 2.8)
project(Xcursor)

include_directories(../include)

file(GLOB SRC "*.c")
add_library(Xcursor SHARED ${SRC})

set_target_properties(Xcursor PROPERTIES
VERSION 6.0
SOVERSION 6
)
install(TARGETS Xcursor DESTINATION lib)