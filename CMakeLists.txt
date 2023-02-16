cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

project(
    "qt-multiplatform-example-workspace-project"
    VERSION 1.0.0
    LANGUAGES C CXX)

# GLOBAL CMAKE VARIABLES
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Enable testing before adding the subdirectories otherwise the ctest can't discover tests recursively
include(CTest)
enable_testing()

# Subdirectories
add_subdirectory(lib)
add_subdirectory(projects)

# Get google test
# GoogleTest requires at least C++14
set(CMAKE_CXX_STANDARD 14)
include(FetchContent)
FetchContent_Declare(
  googletest
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_TAG release-1.12.0
)
FetchContent_MakeAvailable(googletest)