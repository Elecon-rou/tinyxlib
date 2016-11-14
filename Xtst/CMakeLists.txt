cmake_minimum_required(VERSION 2.8)
project(Xtst)

add_definitions(-DHAVE__XEATDATAWORDS)

include_directories(../include)

add_library(Xtst SHARED XRecord.c XTest.c)

set_target_properties(Xtst PROPERTIES
VERSION 6.1
SOVERSION 6
)
install(TARGETS Xtst DESTINATION lib)