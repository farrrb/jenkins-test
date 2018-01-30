cmake_minimum_required(VERSION 3.8)

project(Library)

add_library(Module STATIC module.c)
target_include_directories(Module PUBLIC .)
