cmake_minimum_required(VERSION 3.16 FATAL_ERROR)
include(${CMAKE_SOURCE_DIR}/cmake/helpers.cmake)

basic_setup(device_lib
            "Device Library")

add_project_subdirectories()