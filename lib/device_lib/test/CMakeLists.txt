cmake_minimum_required(VERSION 3.16 FATAL_ERROR)
include(${CMAKE_SOURCE_DIR}/cmake/helpers.cmake)

set(TARGET_NAME "device_lib_test")

add_executable(${TARGET_NAME}
    test_ConcreteDevice.cpp
)
target_link_libraries(${TARGET_NAME}
    device_lib
    GTest::gtest_main
)

include(GoogleTest)
gtest_discover_tests(${TARGET_NAME})