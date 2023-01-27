cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

project(
    "qt-multiplatform-example"
    VERSION 1.0.0
    LANGUAGES C CXX)

# GLOBAL CMAKE VARIABLES
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# PROJECT/LIBRARY NAMES
set(LIBRARY_NAME "prodcode")
set(EXTERNAL_LIB_NAME "extTest")
# set(UNIT_TEST_NAME "unit_tests")
set(EXE_CONTROL "control")
set(EXE_UI "ui")

# EXTERNAL LIBRARIES
# find_package(GoogleTest)
find_package(Qt5 COMPONENTS Gui Qml Core REQUIRED)

# SUB DIRECTORIES
# add_subdirectory(external)
add_subdirectory(lib)
add_subdirectory(app)
# add_subdirectory(tests)
