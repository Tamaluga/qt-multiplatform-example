#!/bin/bash

############################################################
# Functions                                                #
############################################################

function err()
{
  # Log to STDERR
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $*" >&2
}

function log()
{
    BOLD=$(tput bold)
    NORMAL=$(tput sgr0)
    CYAN='\e[36m'
    NC='\033[0m' # No Color
    if $VERBOSE_MODE  ; then
        echo -e "$BOLD$CYAN$1$NC$NORMAL"
    fi
}

function printHelp()
{
   # Display Help
   echo "Build script for qt multiplatform example."
   echo
   echo "Syntax: scriptTemplate [-t|x|a|i|u|v]"
   echo "options:"
   echo "t     Build type. [Release|Debug]"
   echo "x     Enable crosscompiling to arm."
   echo "a     Build app."
   echo "i     Build integration tests."
   echo "u     Build unit tests."
   echo "c     Clean all before building."
   echo "v     Verbose mode."
   echo
}

function printBuildSetup()
{
    log "Build setup"
    log "TOOLCHAIN_FILE:         $TOOLCHAIN_FILE"
    log "BUILD_TYPE:             $BUILD_TYPE"
    log "BUILD_DIR:              $BUILD_DIR"
    log "SOURCE_DIR:             $SOURCE_DIR"
    log "CLEAN_BUILD:            $CLEAN_BUILD"
    log "CROSS_BUILD:            $CROSS_BUILD"
    log "BUILD_APP:              $BUILD_APP"
    log "BUILD_INTEGRATION_TEST: $BUILD_INTEGRATION_TEST"
    log "BUILD_UNIT_TEST:        $BUILD_UNIT_TEST"
}

############################################################
############################################################
# Main program                                             #
############################################################
############################################################

# Set variables
SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
SOURCE_DIR="$SCRIPT_PATH"
BUILD_DIR_TOP_FOLDER="$SCRIPT_PATH/build"
BUILD_DIR="$BUILD_DIR_TOP_FOLDER"
BUILD_TYPE_RELEASE="Release"
BUILD_TYPE_DEBUG="Debug"
BUILD_TYPE="$BUILD_TYPE_DEBUG"
CLEAN_BUILD=false
CROSS_BUILD=false
BUILD_APP=false
BUILD_INTEGRATION_TEST=false
BUILD_UNIT_TEST=false
VERBOSE_MODE=false
TOOLCHAIN_PATH="$SOURCE_DIR/cmake"
TOOLCHAIN_NAME_ARM="arm-phytec-linux-gnueabi-gcc-toolchain"
TOOLCHAIN_NAME_NATIVE="gcc-linux-toolchain"
TOOLCHAIN_FILE=""

############################################################
# Process the input options. Add options as needed.        #
############################################################
# Get the options
while getopts "ht:xaiucv" flag; do
   case "$flag" in
      h) # display Help
         printHelp
         exit;;
      t) # Build type
         BUILD_TYPE="$OPTARG";;
      x) # Clean build
         CROSS_BUILD=true;;
      a) # Enable building of the app
         BUILD_APP=true;;
      i) # Enable building of the integration tests
         BUILD_INTEGRATION_TEST=true;;
      u) # Enable building of the unit tests
         BUILD_UNIT_TEST=true;;
      c) # Enable building of the unit tests
         CLEAN_BUILD=true;;
      v) # Enable verbose mode
         VERBOSE_MODE=true;;
     \?) # Invalid option
         err "Error: Invalid option"
         exit 22;;
   esac
done

############################################################
# Prepare build variables and folder                       #
############################################################

if [ $CROSS_BUILD = true ] ; then
    TOOLCHAIN_FILE="$TOOLCHAIN_PATH/$TOOLCHAIN_NAME_ARM.cmake"
    BUILD_DIR="$BUILD_DIR/$TOOLCHAIN_NAME_ARM"
else
    TOOLCHAIN_FILE="$TOOLCHAIN_PATH/$TOOLCHAIN_NAME_NATIVE.cmake"
    BUILD_DIR="$BUILD_DIR/$TOOLCHAIN_NAME_NATIVE"
fi

if   [ "$BUILD_TYPE" == "$BUILD_TYPE_DEBUG" ] ; then
    BUILD_DIR="$BUILD_DIR/$BUILD_TYPE"
elif [ "$BUILD_TYPE" == "$BUILD_TYPE_RELEASE" ] ; then
    BUILD_DIR="$BUILD_DIR/$BUILD_TYPE"
else
    err "Error: Invalid build type: $BUILD_TYPE"
    exit 22
fi

if [ $CLEAN_BUILD = true ] ; then
    rm -r $BUILD_DIR_TOP_FOLDER
fi
mkdir -p $BUILD_DIR_TOP_FOLDER

############################################################
# Build                                                    #
############################################################

printBuildSetup

# Generate the build system using Ninja
log "Configure build system"
cmake -DCMAKE_TOOLCHAIN_FILE=$TOOLCHAIN_FILE -DCMAKE_BUILD_TYPE=$BUILD_TYPE -B"$BUILD_DIR" -S"$SOURCE_DIR"
# And then do the build
log "Start build"
cmake --build $BUILD_DIR -j 4 -v