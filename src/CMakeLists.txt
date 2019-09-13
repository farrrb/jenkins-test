cmake_minimum_required(VERSION 3.8)

project(Library C)

add_library(Module STATIC Module.c)
target_include_directories(Module PUBLIC .)

