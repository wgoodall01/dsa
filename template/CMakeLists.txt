cmake_minimum_required (VERSION 2.6)
set(CMAKE_CXX_STANDARD 11)

project ({Name})

include_directories(include)
add_executable({name} main.cpp)
add_executable(test_{name} test.cpp)
