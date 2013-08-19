# CMakeLists.txt to build static glew for The Game Engine
cmake_minimum_required(VERSION 2.6)

project(glew C)

if(NOT CMAKE_BUILD_TYPE)
    #SET(CMAKE_BUILD_TYPE "Debug")
    SET(CMAKE_BUILD_TYPE "Release")
endif()

# to distinguish between debug and release lib
set(CMAKE_DEBUG_POSTFIX "d")

set(glew_SRCS src/glew.c)
set(glew_HDRS include/GL/glew.h)

include_directories(include)

if(MSVC)
    add_definitions(/DGLEW_STATIC)
	list(APPEND glew_HDRS include/GL/wglew.h)
    list(APPEND glew_SRCS build/glew.rc)
endif()

add_library(glew ${glew_SRCS} ${glew_HDRS})

install(TARGETS glew #glew_dynamic
    RUNTIME DESTINATION bin
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib)

install(FILES ${glew_HDRS} DESTINATION include/GL)