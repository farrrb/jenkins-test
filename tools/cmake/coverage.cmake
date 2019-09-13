# Code coverage using gcovr
macro(coverage_enable)

    if(CMAKE_C_COMPILER_ID MATCHES "GNU")
        # you can specify the gcovr exe manually if you want to...
        if(NOT COVERAGE_GCOVR_EXE)
            set(COVERAGE_GCOVR_EXE "gcovr")
        endif()

        if(NOT COVERAGE_OUTPUT_DIR)
            set(COVERAGE_OUTPUT_DIR ".")
        endif()

        set(COVERAGE_GCC_COMPILE_FLAGS  "--coverage")
        set(COVERAGE_GCC_LINK_FLAGS     "--coverage")

        set(CMAKE_C_FLAGS               "${CMAKE_C_FLAGS}      ${COVERAGE_GCC_COMPILE_FLAGS}")
        set(CMAKE_CXX_FLAGS             "${CMAKE_CXX_FLAGS}    ${COVERAGE_GCC_COMPILE_FLAGS}")
        set(CMAKE_EXE_LINKER_FLAGS      "${CMAKE_LINKER_FLAGS} ${COVERAGE_GCC_LINK_FLAGS}")

        add_custom_command(OUTPUT __coverage_execute_gcov
            POST_BUILD
            COMMAND ${COVERAGE_GCOVR_EXE} -r ${CMAKE_SOURCE_DIR}/src --object-dir=${CMAKE_BINARY_DIR} --xml-pretty -s -o ${COVERAGE_OUTPUT_DIR}/coverage.xml
            COMMAND ${COVERAGE_GCOVR_EXE} -r ${CMAKE_SOURCE_DIR}/src --object-dir=${CMAKE_BINARY_DIR} --html --html-details -o ${COVERAGE_OUTPUT_DIR}/coverage.html
            #COMMAND ${COVERAGE_GCOVR_EXE} -r ${CMAKE_SOURCE_DIR}/src --object-dir=${CMAKE_BINARY_DIR} --branches --exclude-unreachable-branches -e test_* WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
        )
        add_custom_target(coverage DEPENDS __coverage_execute_gcov)
    else()
        message(STATUS "Compiler id \"${CMAKE_C_COMPILER_ID}\" is not supported at the moment!")
    endif()
endmacro()

