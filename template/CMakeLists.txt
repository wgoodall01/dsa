cmake_minimum_required (VERSION 2.6)
set(CMAKE_CXX_STANDARD 11)

project (TemplateProj)

include_directories(include)

set(srcs
	lib.cpp
)

add_executable(templateProj ${srcs} main.cpp)
add_executable(test_templateProj ${srcs} test.cpp)
