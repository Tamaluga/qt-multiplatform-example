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
   echo "options:"
   echo "-b [Release|Debug]  Build type. "
   echo "-x                  Enable crosscompiling to arm."
   echo "-a                  Build app."
   echo "-i                  Build all integration tests."
   echo "-u                  Build all unit tests."
   echo "-t [TARGET_NAME]    Build specific target."
   echo "-c                  Clean all before building."
   echo "-v                  Verbose mode."
   echo
   echo "When no parameter is given, builds all targets" 
   echo "in debug mode for the native platform."
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
    log "TARGETS_TO_BUILD:       $TARGETS_TO_BUILD"
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
TARGETS_APP="firmware"
TARGETS_INTEGRATION_TEST="test_control"
TARGETS_UNIT_TEST="device_lib_test module_lib_test"
TARGETS_TO_BUILD=""

############################################################
# Process the input options. Add options as needed.        #
############################################################
# Get the options
while getopts "hb:xaiut:cv" flag; do
   case "$flag" in
      h) # display Help
         printHelp
         exit;;
      b) # Build type
         BUILD_TYPE="$OPTARG";;
      x) # Clean build
         CROSS_BUILD=true;;
      a) # Enable building of the app
         BUILD_APP=true;;
      i) # Enable building of the integration tests
         BUILD_INTEGRATION_TEST=true;;
      u) # Enable building of the unit tests
         BUILD_UNIT_TEST=true;;
      t) # Specific target
         TARGETS_TO_BUILD="$OPTARG";;
      c) # Enable building of the unit tests
         CLEAN_BUILD=true;;
      v) # Enable verbose mode
         VERBOSE_MODE=true;;
     \?) # Invalid option
         err "Error: Invalid option"
         exit 22;;
   esac
done

# Build all targets if no target was selected
if [ $BUILD_APP = false ] && 
   [ $BUILD_INTEGRATION_TEST = false ] && 
   [ $BUILD_UNIT_TEST = false ] && 
   [ -z $TARGETS_TO_BUILD ]; then
    BUILD_APP=true
    BUILD_INTEGRATION_TEST=true
    BUILD_UNIT_TEST=true
fi

############################################################
# Prepare build variables and folder                       #
############################################################

# Set toolchain file and top folder of build directory
if [ $CROSS_BUILD = true ] ; then
    TOOLCHAIN_FILE="$TOOLCHAIN_PATH/$TOOLCHAIN_NAME_ARM.cmake"
    BUILD_DIR="$BUILD_DIR/$TOOLCHAIN_NAME_ARM"
else
    TOOLCHAIN_FILE="$TOOLCHAIN_PATH/$TOOLCHAIN_NAME_NATIVE.cmake"
    BUILD_DIR="$BUILD_DIR/$TOOLCHAIN_NAME_NATIVE"
fi

# Set build directory
if   [ "$BUILD_TYPE" == "$BUILD_TYPE_DEBUG" ] ; then
    BUILD_DIR="$BUILD_DIR/$BUILD_TYPE"
elif [ "$BUILD_TYPE" == "$BUILD_TYPE_RELEASE" ] ; then
    BUILD_DIR="$BUILD_DIR/$BUILD_TYPE"
else
    err "Error: Invalid build type: $BUILD_TYPE"
    exit 22
fi

# Set targets to build
if [ $BUILD_APP = true ] ; then
    TARGETS_TO_BUILD="${TARGETS_TO_BUILD} ${TARGETS_APP}"
fi
if [ $BUILD_INTEGRATION_TEST = true ] ; then
    TARGETS_TO_BUILD="${TARGETS_TO_BUILD} ${TARGETS_INTEGRATION_TEST}"
fi
if [ $BUILD_UNIT_TEST = true ] ; then
    TARGETS_TO_BUILD="${TARGETS_TO_BUILD} ${TARGETS_UNIT_TEST}"
fi

# Clean build directory if configured
if [ $CLEAN_BUILD = true ] ; then
    rm -rf $BUILD_DIR
fi

############################################################
# Build                                                    #
############################################################

printBuildSetup

# Generate the build system using Ninja
log "Configure build system"
cmake -DCMAKE_TOOLCHAIN_FILE=$TOOLCHAIN_FILE -DCMAKE_BUILD_TYPE=$BUILD_TYPE -B"$BUILD_DIR" -S"$SOURCE_DIR"
# And then do the build
log "Start build"
cmake --build $BUILD_DIR --target $TARGETS_TO_BUILD -j 4 -v