cmake_minimum_required(VERSION 3.8)

project(jenkins-test C)

# code coverage
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/externals/cmake-codecov/cmake")

find_package(codecov)

add_subdirectory(externals)
add_subdirectory(src)
add_subdirectory(test)
