rmdir /s /q build
mkdir build
cd build
cmake -G "MinGW Makefiles" -DCMAKE_BUILD_TYPE=Debug -DENABLE_COVERAGE=On ..
cmake --build .
cmake --build . --target test
cmake --build . --target gcov
