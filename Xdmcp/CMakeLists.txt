cmake_minimum_required(VERSION 2.8)
project(Xdmcp)

include_directories(../include)

file(GLOB SRC "*.c")
add_library(Xdmcp SHARED ${SRC})

set_target_properties(Xdmcp PROPERTIES
VERSION 6.0
SOVERSION 6
)
install(TARGETS Xdmcp DESTINATION lib)