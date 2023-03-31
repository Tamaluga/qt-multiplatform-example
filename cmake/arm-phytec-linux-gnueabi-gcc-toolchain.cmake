set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(PHYTEC_BSP_PATH "/opt/phytec-yogurt/BSP-Yocto-i.MX6-PD20.1.0/sysroots")
set(CMAKE_SYSROOT "${PHYTEC_BSP_PATH}/cortexa9t2hf-neon-phytec-linux-gnueabi")

set(tools "${PHYTEC_BSP_PATH}/x86_64-phytecsdk-linux")
set(CMAKE_C_COMPILER "${tools}/usr/bin/arm-phytec-linux-gnueabi/arm-phytec-linux-gnueabi-gcc")
set(CMAKE_CXX_COMPILER "${tools}/usr/bin/arm-phytec-linux-gnueabi/arm-phytec-linux-gnueabi-g++")

# see https://cmake.org/cmake/help/latest/manual/cmake-toolchains.7.html#cross-compiling-for-linux
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
# Avoid running the linker in the try compile
set(CMAKE_TRY_COMPILE_TARGET_TYPE "STATIC_LIBRARY")

SET(CMAKE_C_FLAGS "-mfloat-abi=hard -mthumb -mfpu=neon -mcpu=cortex-a9 -Wall -pedantic -Wno-deprecated-declarations -Wno-unused-variable" CACHE STRING "" FORCE)
SET(CMAKE_C_FLAGS_RELEASE "-O2" CACHE STRING "" FORCE)
SET(CMAKE_C_FLAGS_DEBUG   "-O0 -ggdb" CACHE STRING "" FORCE)
SET(CMAKE_CXX_FLAGS "-mfloat-abi=hard -mthumb -mfpu=neon -mcpu=cortex-a9 -Wall -pedantic -Wno-deprecated-declarations -Wno-unused-variable" CACHE STRING "" FORCE)
SET(CMAKE_CXX_FLAGS_RELEASE "-O2" CACHE STRING "" FORCE)
SET(CMAKE_CXX_FLAGS_DEBUG   "-O0 -ggdb" CACHE STRING "" FORCE)

set(OE_QMAKE_PATH_EXTERNAL_HOST_BINS "${PHYTEC_BSP_PATH}/x86_64-phytecsdk-linux/usr/bin" CACHE STRING "" FORCE)