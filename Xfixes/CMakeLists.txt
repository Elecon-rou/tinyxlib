cmake_minimum_required(VERSION 2.8)
project(Xfixes)

add_definitions(-DHAVE__XEATDATAWORDS)

include_directories(../include)

file(GLOB SRC "*.c")
add_library(Xfixes SHARED ${SRC})

set_target_properties(Xfixes PROPERTIES
VERSION 3.0
SOVERSION 3
)
install(TARGETS Xfixes DESTINATION lib)