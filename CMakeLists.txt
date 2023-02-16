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

# Options
option(TESTING_ENABLED "Enable a Unit Testing build." OFF)

# Enable testing before adding the subdirectories otherwise the ctest can't discover tests recursively
if(TESTING_ENABLED)
  # Enable ctest
  include(CTest)
  enable_testing()

  # Get google test
  include(FetchContent)
  FetchContent_Declare(
    googletest
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG release-1.12.0
  )
  FetchContent_MakeAvailable(googletest)
endif()

# Subdirectories
add_subdirectory(lib)
add_subdirectory(projects)
