# GCC Linux Toolchain
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR amd)

set(CMAKE_C_COMPILER gcc)
set(CMAKE_ASM_COMPILER ${CMAKE_C_COMPILER})
set(CMAKE_CXX_COMPILER g++)
set(CMAKE_CXX_COMPILER_AR gcc-ar)
set(CMAKE_AR gcc-ar)
set(CMAKE_RANLIB gcc-ranlib)
set(CMAKE_ADDR2LINE addr2line)

# Default C++ compiler flags
SET(CMAKE_C_FLAGS "-Wall -pedantic -Wno-deprecated-declarations -Wno-unused-variable" CACHE STRING "" FORCE)
SET(CMAKE_C_FLAGS_RELEASE "-O2" CACHE STRING "" FORCE)
SET(CMAKE_C_FLAGS_DEBUG   "-O0 -ggdb" CACHE STRING "" FORCE)
SET(CMAKE_CXX_FLAGS "-Wall -pedantic -Wno-deprecated-declarations -Wno-unused-variable" CACHE STRING "" FORCE)
SET(CMAKE_CXX_FLAGS_RELEASE "-O2" CACHE STRING "" FORCE)
SET(CMAKE_CXX_FLAGS_DEBUG   "-O0 -ggdb" CACHE STRING "" FORCE)

set(CMAKE_PREFIX_PATH "/usr/lib/x86_64-linux-gnu/.cmake/Qt5" CACHE FILEPATH "prefix path" FORCE)