cmake_minimum_required(VERSION 2.8)
project(Xau)

include_directories(../include)

file(GLOB SRC "*.c")
add_library(Xau SHARED ${SRC})

set_target_properties(Xau PROPERTIES
VERSION 6.0
SONAME 6
)
install(TARGETS Xau DESTINATION lib)