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

# SUB DIRECTORIES
# add_subdirectory(external)
add_subdirectory(lib)
add_subdirectory(projects)
# add_subdirectory(tests)