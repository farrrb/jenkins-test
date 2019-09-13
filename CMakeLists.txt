cmake_minimum_required(VERSION 3.8)

project(jenkins-test C)

# Enable code coverage
include(tools/cmake/coverage.cmake)

# Enable ctest
enable_testing()

# enable code coverage
coverage_enable()

add_subdirectory(externals)
add_subdirectory(src)
add_subdirectory(test)
