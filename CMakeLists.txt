cmake_minimum_required(VERSION 3.13)

# Include the Pico SDK cmake file
include($ENV{PICO_SDK_PATH}/external/pico_sdk_import.cmake)

# Set the project name and languages before pico_sdk_init()
project(HOJA-DEVICE-FW C CXX ASM)

# Initialize the SDK
pico_sdk_init()

# Global build directory setup
set(GLOBAL_BUILD_DIR ${CMAKE_SOURCE_DIR}/builds)

# Option to build specific board or all
option(BUILD_ALL_BOARDS "Build all boards" OFF)
option(BUILD_PROGCC "Build ProgCC 3.2" OFF)
option(BUILD_OTHER "Build Other Board" OFF)

# Set cross-compilation settings
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR ARM)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

if(BUILD_ALL_BOARDS OR BUILD_PROGCC)
    add_subdirectory(boards/progcc-3.2)
endif()

if(BUILD_ALL_BOARDS OR BUILD_OTHER)
    add_subdirectory(boards/other-board)
endif()