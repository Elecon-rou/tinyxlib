cmake_minimum_required(VERSION 2.8)
project(SM)

add_definitions(-DUNIXCONN -DTCPCONN)

include_directories(../include)

file(GLOB SRC "*.c")
add_library(SM SHARED ${SRC})

set_target_properties(SM PROPERTIES
VERSION 6.0
SOVERSION 6
)
install(TARGETS SM DESTINATION lib)