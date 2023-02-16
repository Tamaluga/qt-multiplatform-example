cmake_minimum_required(VERSION 3.16 FATAL_ERROR)
include(${CMAKE_SOURCE_DIR}/cmake/helpers.cmake)

set(TARGET_NAME "module_lib")
set(TARGET_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../include")
set(TARGET_SOURCES 
    Module.cpp
)

# Create library
add_library(${TARGET_NAME} STATIC ${TARGET_SOURCES})
target_include_directories(${TARGET_NAME} PUBLIC ${TARGET_INCLUDE_DIR})
target_link_libraries(${TARGET_NAME}
    device_lib
)