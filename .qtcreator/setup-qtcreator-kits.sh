#!/bin/bash

# Set variables
SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
QT_PROJECT_CONFIG_PATH="$HOME/.config/QtProject"
QT_CREATOR_CONFIG_PATH="$QT_PROJECT_CONFIG_PATH/qtcreator"
QT_CREATOR_INI_FILE="$QT_PROJECT_CONFIG_PATH/QtCreator.ini"

# Copy qt creator config files
if [ -d "$QT_CREATOR_CONFIG_PATH" ]; then
    # Copy files
    pushd $SCRIPT_PATH
    cp *.xml "$QT_CREATOR_CONFIG_PATH"
    popd
else
    echo "Error: Directory does not exist: $QT_CREATOR_CONFIG_PATH"
    exit 2
fi

# Set build directory
if [ -f "$QT_CREATOR_INI_FILE" ]; then
    # Replace build directory template entry
    BUILD_DIR_TEMPLATE="BuildDirectory.Template=.*"
    BUILD_DIR_TEMPLATE_NEW="BuildDirectory.Template=build\/%{JS: Util.asciify(\\\\\"%{CurrentKit:FileSystemName}\\\\\")}\/%{JS: Util.asciify(\\\\\"%{CurrentBuild:Name}\\\\\")}"
    sed -i "s/$BUILD_DIR_TEMPLATE/$BUILD_DIR_TEMPLATE_NEW/g" $QT_CREATOR_INI_FILE
else
    echo "Error: File does not exist: $QT_CREATOR_INI_FILE"
    exit 2
fi
