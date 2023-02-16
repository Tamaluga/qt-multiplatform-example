cmake_minimum_required(VERSION 3.16 FATAL_ERROR)
include(${CMAKE_SOURCE_DIR}/cmake/helpers.cmake)

set(TARGET_NAME "module_lib_test")

add_executable(${TARGET_NAME}
    test_Module.cpp
)
target_link_libraries(${TARGET_NAME}
    # device_lib_mock
    module_lib
    GTest::gtest_main
    gmock_main
)
target_include_directories(${TARGET_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

include(GoogleTest)
gtest_discover_tests(${TARGET_NAME})
