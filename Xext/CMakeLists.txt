cmake_minimum_required(VERSION 2.8)
project(Xext)

include_directories(../include)

file(GLOB SRC "*.c")
add_library(Xext SHARED ${SRC})

set_target_properties(Xext PROPERTIES
VERSION 6.5
SOVERSION 6
)
install(TARGETS Xext DESTINATION lib)