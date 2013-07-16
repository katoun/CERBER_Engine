cmake_minimum_required(VERSION 2.6 FATAL_ERROR)
cmake_policy(VERSION 2.6)

project(glm)

include_directories(".")

install(DIRECTORY glm DESTINATION include)