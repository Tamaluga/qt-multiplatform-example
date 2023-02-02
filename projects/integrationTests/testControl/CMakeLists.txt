cmake_minimum_required(VERSION 3.16 FATAL_ERROR)
include(${CMAKE_SOURCE_DIR}/cmake/helpers.cmake)

basic_setup(${EXE_TEST_CONTROL})

find_package(Qt5 COMPONENTS Core REQUIRED)

set(APP_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/main.cpp")

add_executable(${EXE_TEST_CONTROL} ${APP_SOURCES})

target_link_libraries(
    ${EXE_TEST_CONTROL}
    PUBLIC ${LIBRARY_NAME}
    Qt5::Core
)