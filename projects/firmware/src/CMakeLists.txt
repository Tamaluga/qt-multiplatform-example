cmake_minimum_required(VERSION 3.16 FATAL_ERROR)
include(${CMAKE_SOURCE_DIR}/cmake/helpers.cmake)

set(TARGET_NAME "exe-firmware")

basic_setup(${TARGET_NAME})

find_package(Qt5 COMPONENTS Gui Qml Core REQUIRED)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC OFF)
set(CMAKE_AUTOUIC OFF)

add_executable(${TARGET_NAME}
    main.cpp
)

target_link_libraries(${TARGET_NAME}
    Qt5::Core
    Qt5::Gui
    Qt5::Qml
)