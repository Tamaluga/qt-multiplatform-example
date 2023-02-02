cmake_minimum_required(VERSION 3.16 FATAL_ERROR)
include(${CMAKE_SOURCE_DIR}/cmake/helpers.cmake)

set(TARGET_NAME "lib-my-lib")

# Sources and Headers
set(TARGET_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/calculator.cpp")
set(TARGET_HEADERS "${CMAKE_CURRENT_SOURCE_DIR}/calculator.hpp")

# MyLib Library
add_library(${TARGET_NAME} STATIC ${TARGET_SOURCES} ${TARGET_HEADERS})
target_include_directories(${TARGET_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(${TARGET_NAME} m)