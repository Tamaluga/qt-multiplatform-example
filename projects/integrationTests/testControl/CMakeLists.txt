cmake_minimum_required(VERSION 3.16 FATAL_ERROR)
include(${CMAKE_SOURCE_DIR}/cmake/helpers.cmake)

set(TARGET_NAME "test-control")

basic_setup(${TARGET_NAME})

find_package(Qt5 COMPONENTS Core REQUIRED)

set(APP_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/main.cpp")

add_executable(${TARGET_NAME} ${APP_SOURCES})

target_link_libraries(${TARGET_NAME} PUBLIC
    my_lib
    Qt5::Core
)