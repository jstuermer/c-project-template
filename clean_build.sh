#!/bin/bash

BUILD_DIR="build/"

if [ -d "$BUILD_DIR" ]; then
    echo "Removing existing build directory..."
    rm -rf "$BUILD_DIR"
else
    echo "No existing build directory found."
fi

mkdir ${BUILD_DIR}

echo "Generating build files..."
cmake . -B ${BUILD_DIR}

echo "Building the project..."
cmake --build ${BUILD_DIR}