cmake_minimum_required(VERSION 3.15...3.31)
project(
  "C Project Template"
  VERSION 0.1
  DESCRIPTION "This is just a template that provides a good starting point."
  LANGUAGES C
)

set(CMAKE_C_STANDARD 17)
set(CMAKE_C_STANDARD_REQUIRED True)

# Only include CTest if this is build as the main project.
if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
    include(CTest)
endif()

# FetchContent can be used to download dependencies during the configure step.
include(FetchContent)

# Source code
add_subdirectory(src)

# Add tests if this is build as the main project and not if it is included.
if((CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME OR MODERN_CMAKE_BUILD_TESTING)
  AND BUILD_TESTING)
  add_subdirectory(tests)
endif()
