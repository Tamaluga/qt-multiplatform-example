cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

project(
    "arrosto-workspace-project"
    VERSION 1.0.0
    LANGUAGES C CXX)

# GLOBAL CMAKE VARIABLES
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# PROJECT/LIBRARY NAMES
set(LIBRARY_NAME "library-xy")
# set(EXTERNAL_LIB_NAME "external-library-xy")
# set(UNIT_TEST_NAME "unit_tests")
set(EXE_TEST_CONTROL "integration-test-control")
set(EXE_FIRMWARE "firmware")

# SUB DIRECTORIES
# add_subdirectory(external)
add_subdirectory(lib)
add_subdirectory(projects)
# add_subdirectory(tests)