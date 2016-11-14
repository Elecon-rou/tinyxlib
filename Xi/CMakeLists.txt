cmake_minimum_required(VERSION 2.8)
project(Xi)

include_directories(../include)

file(GLOB SRC "*.c")
add_library(Xi SHARED ${SRC})

set_target_properties(Xi PROPERTIES 
VERSION 6.0
SOVERSION 6
)
install(TARGETS Xi DESTINATION lib)