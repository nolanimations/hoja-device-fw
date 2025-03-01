# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION ${CMAKE_VERSION}) # this file comes with cmake

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "F:/Pico SDK/tools/pioasm")
  file(MAKE_DIRECTORY "F:/Pico SDK/tools/pioasm")
endif()
file(MAKE_DIRECTORY
  "C:/Users/Nolan/Documents/GitHub/hoja-device-fw/boards/progcc_3.2/buildpic/pioasm"
  "C:/Users/Nolan/Documents/GitHub/hoja-device-fw/boards/progcc_3.2/buildpic/pioasm-install"
  "C:/Users/Nolan/Documents/GitHub/hoja-device-fw/library/artifacts/pioasm/tmp"
  "C:/Users/Nolan/Documents/GitHub/hoja-device-fw/library/artifacts/pioasm/src/pioasmBuild-stamp"
  "C:/Users/Nolan/Documents/GitHub/hoja-device-fw/library/artifacts/pioasm/src"
  "C:/Users/Nolan/Documents/GitHub/hoja-device-fw/library/artifacts/pioasm/src/pioasmBuild-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "C:/Users/Nolan/Documents/GitHub/hoja-device-fw/library/artifacts/pioasm/src/pioasmBuild-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "C:/Users/Nolan/Documents/GitHub/hoja-device-fw/library/artifacts/pioasm/src/pioasmBuild-stamp${cfgdir}") # cfgdir has leading slash
endif()
