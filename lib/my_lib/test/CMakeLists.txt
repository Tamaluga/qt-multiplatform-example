cmake_minimum_required(VERSION 3.16 FATAL_ERROR)
include(${CMAKE_SOURCE_DIR}/cmake/helpers.cmake)

set(TARGET_NAME "my_lib_test")

add_executable(${TARGET_NAME}
  hello_test.cpp
)
target_link_libraries(${TARGET_NAME}
  GTest::gtest_main
)

include(GoogleTest)
gtest_discover_tests(${TARGET_NAME})
