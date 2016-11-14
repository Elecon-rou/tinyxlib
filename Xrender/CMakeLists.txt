cmake_minimum_required(VERSION 2.8)
project(Xrender)

include_directories(../include)

file(GLOB SRC "*.c")
add_library(Xrender SHARED ${SRC})

set_target_properties(Xrender PROPERTIES
VERSION 1.1
SOVERSION 1
)
install(TARGETS Xrender DESTINATION lib)