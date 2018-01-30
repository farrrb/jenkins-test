cmake_minimum_required(VERSION 3.8)

project(Externals)

# Unity Test Framework
add_library(Unity STATIC Unity/src/unity.c)
target_include_directories(Unity PUBLIC Unity/src)
