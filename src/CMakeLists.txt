cmake_minimum_required(VERSION 3.8)

project(Library C)

add_library(Module STATIC Module.c)
target_include_directories(Module PUBLIC .)

add_coverage(Module)

set(GCOVR_EXECUTABLE python C:/Python36/Scripts/gcovr)
set(OUT_DIR "${CMAKE_CURRENT_BINARY_DIR}/CMakeFiles/Module.dir")
add_custom_target(coverage_xml  WORKING_DIRECTORY ${OUT_DIR} COMMAND ${GCOVR_EXECUTABLE} -v  --filter=.* --xml-pretty -o ${CMAKE_BINARY_DIR}/coverage.xml)
add_custom_target(coverage_html WORKING_DIRECTORY ${OUT_DIR} COMMAND ${GCOVR_EXECUTABLE} -v  --filter=.* --html -o ${CMAKE_BINARY_DIR}/coverage.html)
