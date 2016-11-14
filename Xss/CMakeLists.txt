cmake_minimum_required(VERSION 2.8)
project(Xss)

include_directories(../include)

add_library(Xss SHARED XScrnSaver.c)

set_target_properties(Xss PROPERTIES
VERSION 1.0
SOVERSION 1 
)