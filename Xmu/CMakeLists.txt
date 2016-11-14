cmake_minimum_required(VERSION 2.8)
project(Xmu)

include_directories(../include)

file(GLOB SRC "*.c")
add_library(Xmu SHARED ${SRC})

set_target_properties(Xmu PROPERTIES
VERSION 6.2
SOVERSION 6
)
install(TARGETS Xmu DESTINATION lib)