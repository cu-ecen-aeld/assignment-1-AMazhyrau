#!/bin/bash
# Run unit tests for the assignment

# Automate these steps from the readme:
# Create a build subdirectory, change into it, run
# cmake .. && make && run the assignment-autotest application
mkdir -p build
cd build || (echo "Error: Unable change directory to ./build" && exit 1)

# Check if we're on macOS with Apple Silicon
if [ "$(uname)" = "Darwin" ] && [ "$(uname -m)" = "arm64" ]; then
    # On Mac with Apple Silicon, use x86_64 toolchain
    cmake .. -DCMAKE_TOOLCHAIN_FILE=../x86_64-toolchain.cmake
else
    # otherwise, use default toolchain
    cmake ..
fi

make clean
make
cd ..
./build/assignment-autotest/assignment-autotest
