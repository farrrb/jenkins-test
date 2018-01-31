cmake_minimum_required(VERSION 3.8)

project(Tests)

add_executable(test1 test1.c)
target_link_libraries(test1 Module Unity)

add_coverage(test1)
add_test(test1 test1)
