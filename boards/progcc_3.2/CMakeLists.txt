cmake_minimum_required(VERSION 3.13)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

# Initialize Pico SDK
include($ENV{PICO_SDK_PATH}/pico_sdk_init.cmake)

set(PROJECT_NAME_LOCAL progcc_3.2)

if (NOT DEFINED HOJA_LIB_DIR)
    set(HOJA_LIB_DIR ${CMAKE_SOURCE_DIR}/../../library/HOJA-LIB-RP2040)
endif()

if (NOT DEFINED HOJA_LIBOUTPUT_DIR)
    set(HOJA_LIBOUTPUT_DIR ${CMAKE_SOURCE_DIR}/lib)
	file(MAKE_DIRECTORY ${HOJA_LIBOUTPUT_DIR})
endif()

if (NOT DEFINED HOJA_BUILD_DIR)
	set(HOJA_BUILD_DIR ${CMAKE_SOURCE_DIR}/build)
endif()

if (NOT DEFINED SCRIPTS_DIR)
	set(SCRIPTS_DIR ${CMAKE_SOURCE_DIR}/../../scripts)
endif()

if (NOT DEFINED HOJA_OUTPUT_DIR)
	set(HOJA_OUTPUT_DIR ${CMAKE_SOURCE_DIR}/../../builds/${PROJECT_NAME_LOCAL})
	file(MAKE_DIRECTORY ${HOJA_OUTPUT_DIR})
endif()

pico_sdk_init()

# Add HOJA library
add_subdirectory(${HOJA_LIB_DIR} ${HOJA_LIBOUTPUT_DIR})

project(${PROJECT_NAME_LOCAL} C CXX ASM)

add_executable(${PROJECT_NAME_LOCAL}
    main.c
)

include_directories(
	${CMAKE_CURRENT_SOURCE_DIR}
)

target_link_libraries(${PROJECT_NAME_LOCAL}
    PRIVATE
    hoja_lib
)

# Add Pico SDK features
pico_enable_stdio_usb(${PROJECT_NAME_LOCAL} 0)
pico_enable_stdio_uart(${PROJECT_NAME_LOCAL} 0)
pico_add_extra_outputs(${PROJECT_NAME_LOCAL})


add_custom_command(TARGET ${PROJECT_NAME}
 					POST_BUILD
					COMMAND ${CMAKE_COMMAND} 
					-DUF2_SOURCE=${HOJA_BUILD_DIR}/${PROJECT_NAME_LOCAL}.uf2
					-DUF2_TARGET=${HOJA_OUTPUT_DIR}
					-DBIN_SOURCE=${HOJA_BUILD_DIR}/${PROJECT_NAME_LOCAL}.bin
					-DBIN_TARGET=${HOJA_OUTPUT_DIR}
					-DMANIFEST_TARGET=${HOJA_OUTPUT_DIR}
					-P ${SCRIPTS_DIR}/manifest.cmake
					COMMENT "Moving build files and generating manifest.json"
					WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
					)