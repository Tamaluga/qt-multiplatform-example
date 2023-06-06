# GCC Linux Toolchain
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR amd)

set(CMAKE_C_COMPILER clang CACHE STRING "" FORCE)
set(CMAKE_ASM_COMPILER ${CMAKE_C_COMPILER} CACHE STRING "" FORCE)
set(CMAKE_CXX_COMPILER clang++ CACHE STRING "" FORCE)

# Default C++ compiler flags
# See clang address santizier for more information: https://clang.llvm.org/docs/AddressSanitizer.html
SET(CMAKE_C_FLAGS "-fsanitize=bounds -fsanitize=undefined -fsanitize=address -fsanitize-address-use-after-scope -fno-sanitize-recover=all -fno-omit-frame-pointer -Wall -pedantic -Wno-deprecated-declarations -Wno-unused-variable" CACHE STRING "" FORCE)
SET(CMAKE_C_FLAGS_RELEASE "-O2" CACHE STRING "" FORCE)
SET(CMAKE_C_FLAGS_DEBUG   "-O1 -ggdb" CACHE STRING "" FORCE)
SET(CMAKE_CXX_FLAGS "-fsanitize=bounds -fsanitize=undefined -fsanitize=address -fsanitize-address-use-after-scope -fno-sanitize-recover=all -fno-omit-frame-pointer -Wall -pedantic -Wno-deprecated-declarations -Wno-unused-variable" CACHE STRING "" FORCE)
SET(CMAKE_CXX_FLAGS_RELEASE "-O2" CACHE STRING "" FORCE)
SET(CMAKE_CXX_FLAGS_DEBUG   "-O1 -ggdb" CACHE STRING "" FORCE)

set(CMAKE_PREFIX_PATH "/usr/lib/x86_64-linux-gnu/cmake/Qt5" CACHE FILEPATH "prefix path" FORCE)