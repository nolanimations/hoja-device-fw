cmake_minimum_required(VERSION 3.13)

project(${PROJECT_NAME})

# Rest of your existing CMake file remains the same
add_executable(${PROJECT_NAME}
    main.c
)

# Use the passed-in build directory
set_target_properties(${PROJECT_NAME} PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${HOJA_BUILD_DIR}
    RUNTIME_OUTPUT_DIRECTORY ${HOJA_BUILD_DIR}
    ARCHIVE_OUTPUT_DIRECTORY ${HOJA_BUILD_DIR}
    LIBRARY_OUTPUT_DIRECTORY ${HOJA_BUILD_DIR}
)

include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}
)

target_link_libraries(${PROJECT_NAME}
    PRIVATE
    hoja_lib
)

pico_enable_stdio_usb(${PROJECT_NAME} 0)
pico_enable_stdio_uart(${PROJECT_NAME} 0)
pico_add_extra_outputs(${PROJECT_NAME})

add_custom_command(TARGET ${PROJECT_NAME}
    POST_BUILD
    COMMAND ${CMAKE_COMMAND} 
    -DUF2_SOURCE=${HOJA_BUILD_DIR}/${PROJECT_NAME}.uf2
    -DBIN_SOURCE=${HOJA_BUILD_DIR}/${PROJECT_NAME}.bin

    -DUF2_TARGET=${HOJA_BUILDS_PROJECT_DIR}
    -DBIN_TARGET=${HOJA_BUILDS_PROJECT_DIR}
    -DMANIFEST_TARGET=${HOJA_BUILDS_PROJECT_DIR}
    -P ${SCRIPTS_DIR}/manifest.cmake
    COMMENT "Moving build files and generating manifest.json"
    WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}
)