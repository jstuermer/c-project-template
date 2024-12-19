# Fetch testing framework.
FetchContent_Declare(
  clove-unit
  GIT_REPOSITORY https://github.com/fdefelici/clove-unit.git
  GIT_TAG v2.4.6
)
FetchContent_MakeAvailable(clove-unit)

file(GLOB SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/*.c)
add_executable(test_my_lib ${SOURCES})

target_compile_features(test_my_lib PRIVATE c_std_17)

target_link_libraries(test_my_lib PRIVATE my_lib clove-unit)

add_test(NAME test COMMAND test_my_lib)