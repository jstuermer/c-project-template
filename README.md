# C Project Template

A simple template that can be used to start off a new C project.

## Building the project

The build process is orchestrated using [CMake](https://cmake.org/) and follows 
the best practices described in
[modern-cmake](https://cliutils.gitlab.io/modern-cmake/README.html).

To build the project run the following commands in the root directory:

```bash
mkdir build
cmake . -B build
cmake --build build
```

To trigger a clean build the script `clean_build.sh` can be used.

## Tests

Tests are added using the [clove-unit](https://github.com/fdefelici/clove-unit)
framework which is a header-only testing library that can be easily included
using `FetchContent`.

Note that for `FetchContent` to work the used framework has to support
CMake. If that's not the case, a package manager like [Conan](https://conan.io/)
together with `find_package` can help handling dependencies.

Tests can be run by running the test executable `build/tests/test_my_lib` or
using `CTest` by calling `ctest --test-dir build`. The first method should
produce output similar to

```
[INFO] Executing Test Runner with detail level: 'Full'
[INFO] Suites / Tests found: 1 / 1
[INFO] 1) MyLibTestSuite.MyFuncTest.........................[PASS] (0.001 ms)
[INFO] Total: 1, Passed: 1, Failed: 0, Skipped: 0
[INFO] Run duration: 0 ms
[INFO] Run result: SUCCESS :-)
```