cmake_minimum_required(VERSION 3.8)

project(Tests)

enable_testing()

add_executable(test1 test1.c)
target_link_libraries(test1 Unity)
add_test(test1 test1)
