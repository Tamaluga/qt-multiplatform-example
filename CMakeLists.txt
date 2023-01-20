cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

project(
    "CppTemplate"
    VERSION 1.0.0
    LANGUAGES C CXX)

# Global CMake variables are set here
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Project/Library Names
set(LIBRARY_NAME "prodcode")
set(EXTERNAL_LIB_NAME "extTest")
# set(UNIT_TEST_NAME "unit_tests")
set(EXE_CONTROL "control")
set(EXE_UI "ui")

# SUB DIRECTORIES

# add_subdirectory(external)
add_subdirectory(lib)
add_subdirectory(app)
# add_subdirectory(tests)
