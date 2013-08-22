cmake_minimum_required(VERSION 2.8.8)

project(CERBERGameEngine)

if (WIN32)
  set(CMAKE_USE_RELATIVE_PATHS true)
  set(CMAKE_SUPPRESS_REGENERATION true)
endif()

if (CMAKE_BUILD_TYPE STREQUAL "")
    set(CMAKE_BUILD_TYPE "Release" CACHE STRING
      "Choose the type of build, options are: None Debug Release RelWithDebInfo MinSizeRel."
      FORCE)
endif()

# set default .cmake scripts location
set(CMAKE_MODULE_PATH ${CERBERGameEngine_SOURCE_DIR}/CMake)
# set default externals install location
set(CMAKE_PREFIX_PATH ${CERBERGameEngine_SOURCE_DIR}/Dependencies)

set(CERBER_GAME_ENGINE_DIR ${CERBERGameEngine_SOURCE_DIR})
set(CERBER_GAME_ENGINE_DEPS_DIR ${CERBERGameEngine_SOURCE_DIR}/Dependencies)

# Process subdirectories
add_subdirectory(Engine)
add_subdirectory(Launcher)
add_subdirectory(Editor)