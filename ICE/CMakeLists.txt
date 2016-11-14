cmake_minimum_required(VERSION 2.8)
project(ICE)

add_definitions(-DICE_t -DTRANS_CLIENT -DUNIXCONN -DTCPCONN)

include_directories(../include)

file(GLOB SRC "*.c")
add_library(ICE SHARED ${SRC})

set_target_properties(ICE PROPERTIES
VERSION 6.3
SONAME 6
)
install(TARGETS ICE DESTINATION lib)