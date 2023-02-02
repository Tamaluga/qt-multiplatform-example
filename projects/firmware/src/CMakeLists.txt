cmake_minimum_required(VERSION 3.16 FATAL_ERROR)
include(${CMAKE_SOURCE_DIR}/cmake/helpers.cmake)

basic_setup(${EXE_FIRMWARE})

find_package(Qt5 COMPONENTS Gui Qml Core REQUIRED)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC OFF)
set(CMAKE_AUTOUIC OFF)

add_executable(${EXE_FIRMWARE}
    main.cpp
)

target_link_libraries(${EXE_FIRMWARE}
    Qt5::Core
    Qt5::Gui
    Qt5::Qml
)