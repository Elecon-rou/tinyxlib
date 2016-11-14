cmake_minimum_required(VERSION 2.8)
project(Xmuu)

include_directories(../include)

file(GLOB SRC "*.c")
add_library(Xmuu SHARED ${SRC})

set_target_properties(Xmuu PROPERTIES
VERSION 1.0
SOVERSION 1
)
install(TARGETS Xmuu DESTINATION lib)