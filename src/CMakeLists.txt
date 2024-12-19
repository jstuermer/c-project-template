add_executable(main main.c)

target_compile_features(main PRIVATE c_std_17)
target_link_libraries(main PRIVATE my_lib)

# Place final executable in build/bin/
set_target_properties(main PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")

add_subdirectory(lib)
