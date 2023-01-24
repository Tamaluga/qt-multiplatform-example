#!/bin/bash

# Use paths relative to this script's location
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# If you want to build into a different directory, change this variable
SOURCEDIR="$SCRIPTPATH"
BUILDDIR="$SCRIPTPATH/build"

mkdir -p $BUILDDIR
# Generate the build system using Ninja
cmake -DCMAKE_TOOLCHAIN_FILE=$SOURCEDIR/cmake/gcc-linux-toolchain.cmake -B"$BUILDDIR" -GNinja -S"$SOURCEDIR"
# And then do the build
cmake --build $BUILDDIR -j 4 -- -v