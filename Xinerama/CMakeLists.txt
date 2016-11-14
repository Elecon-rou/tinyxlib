cmake_minimum_required(VERSION 2.8)
project(Xinerama)

add_definitions(-DHAVE__XEATDATAWORDS)

include_directories(../include)

add_library(Xinerama SHARED Xinerama.c)

set_target_properties(Xinerama PROPERTIES
VERSION 1.0
)
install(TARGETS Xinerama DESTINATION lib) 