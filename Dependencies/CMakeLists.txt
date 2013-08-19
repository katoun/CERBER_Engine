cmake_minimum_required(VERSION 2.8.8)

project(CERBERGameEngineDependencies)

if (WIN32)
  set(CMAKE_USE_RELATIVE_PATHS true)
  set(CMAKE_SUPPRESS_REGENERATION true)
endif()

if (CMAKE_BUILD_TYPE STREQUAL "")
    set(CMAKE_BUILD_TYPE "Release" CACHE STRING
      "Choose the type of build, options are: None Debug Release RelWithDebInfo MinSizeRel."
      FORCE)
endif()

set(CMAKE_MODULE_PATH ${CERBERGameEngineDependencies_SOURCE_DIR}/../CMake)
set(CERBER_GAME_ENGINE_DIR ${CERBERGameEngineDependencies_SOURCE_DIR}/..)
set(CERBER_GAME_ENGINE_DEPS_DIR ${CERBERGameEngineDependencies_SOURCE_DIR})
set(CERBER_GAME_ENGINE_DEPS_DOWNLOAD_DIR ${CERBERGameEngineDependencies_SOURCE_DIR}/Downloads)

# Download and build all dependencies on Windows and Mac, for Linux recommend using prebuilt packages
set(common_deps ON)

# Options for what components should be downloaded and built
include(ExternalTinyXML)
include(ExternalGLM)
include(ExternalOpenAL)
include(ExternalOggVorbis)
include(ExternalBullet)
include(ExternalGLEW)
include(ExternalPNG)
include(ExternalFreetype)
include(ExternalRecast)
include(ExternalAssimp)
