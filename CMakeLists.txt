cmake_minimum_required(VERSION 3.8)

project(jenkins-test C)

# Enable code coverage
set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/externals/CMake-codecov/cmake" ${CMAKE_MODULE_PATH})
find_package(codecov)

# enable ctest
enable_testing()

add_subdirectory(externals)
add_subdirectory(src)
add_subdirectory(test)
