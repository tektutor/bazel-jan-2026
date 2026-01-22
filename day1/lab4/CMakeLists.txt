cmake_minimum_required(VERSION 3.15)
project(hello CXX)
add_executable(hello main.cpp hello.cpp)
add_executable(hello-test hello.cpp hello_test.cpp)

find_package(GTest REQUIRED)

target_link_libraries(hello-test gtest::gtest)


