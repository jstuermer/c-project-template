set(HEADER_LIST "${CMAKE_SOURCE_DIR}/include/project/my_func.h")

add_library(my_lib my_func.c ${HEADER_LIST})

# Users of this library also need this directory.
target_include_directories(my_lib PUBLIC ../../include)

# Users of this library need C17 standard.
target_compile_features(my_lib PUBLIC c_std_17)

set_target_properties(my_lib PROPERTIES PREFIX "")
