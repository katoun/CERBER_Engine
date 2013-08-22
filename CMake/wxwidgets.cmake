cmake_minimum_required (VERSION 2.8)
project (wxwidgets)

set(CMAKE_CONFIGURATION_TYPES "Debug;Release" CACHE STRING "Configs" FORCE)
set(CMAKE_COLOR_MAKEFILE ON)

# parse the version number from gdal_version.h and include in wxMAJOR_VERSION and wxMINOR_VERSION
file(READ ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/version.h WX_VERSION_H_CONTENTS)
string(REGEX MATCH "wxMAJOR_VERSION[ \t]+([0-9]+)"
  wxMAJOR_VERSION ${WX_VERSION_H_CONTENTS})
string (REGEX MATCH "([0-9]+)"
  wxMAJOR_VERSION ${wxMAJOR_VERSION})
string(REGEX MATCH "wxMINOR_VERSION[ \t]+([0-9]+)"
  wxMINOR_VERSION ${WX_VERSION_H_CONTENTS})
string (REGEX MATCH "([0-9]+)"
  wxMINOR_VERSION ${wxMINOR_VERSION})
string(REGEX MATCH "wxRELEASE_NUMBER[ \t]+([0-9]+)"
  wxRELEASE_NUMBER ${WX_VERSION_H_CONTENTS})  
string (REGEX MATCH "([0-9]+)"
  wxRELEASE_NUMBER ${wxRELEASE_NUMBER})
    
# Setup package meta-data
set(WX_VERSION ${wxMAJOR_VERSION}.${wxMINOR_VERSION}.${wxRELEASE_NUMBER})
message(STATUS "wxwidgets version=[${WX_VERSION}]")
message(STATUS "c++ compiler ... " ${CMAKE_CXX_COMPILER})

include_directories(${CMAKE_CURRENT_SOURCE_DIR})
include_directories(${CMAKE_CURRENT_BINARY_DIR})
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)

# set(WX_CURRENT_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR})
# set(WX_CURRENT_BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR})

set(WX_STATIC ON)

if(WX_SHARED)
    if(CMAKE_CL_64)
        set(WX_OUTPUT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/lib/vc_dll64)
    else()
        set(WX_OUTPUT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/lib/vc_dll)
    endif()    
    add_definitions(-D_USRDLL)
elseif(WX_STATIC)
    if(CMAKE_CL_64)
        set(WX_OUTPUT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/lib/vc_lib64)
    else()    
        set(WX_OUTPUT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/lib/vc_lib)
    endif()   
endif()

include_directories(${WX_OUTPUT_PATH}/msw)

# set path to additional CMake modules
set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake ${CMAKE_MODULE_PATH})

# For windows, do not allow the compiler to use default target (Vista).
if(WIN32)
  add_definitions(-D_WIN32_WINNT=0x0501 -D__WXMSW__)
endif(WIN32)

add_definitions(-DSTRICT -D_UNICODE -DWXBUILDING)

if(UNIX)
     if(CMAKE_COMPILER_IS_GNUCXX OR CV_ICC)
        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC")
     endif()
endif()

set (CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${WX_OUTPUT_PATH} CACHE PATH "Single Directory for all Executables.")
set (CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG ${WX_OUTPUT_PATH} CACHE PATH "Single Directory for all Libraries")
set (CMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG ${WX_OUTPUT_PATH} CACHE PATH "Single Directory for all static libraries.")
set (CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${WX_OUTPUT_PATH} CACHE PATH "Single Directory for all Executables.")
set (CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE ${WX_OUTPUT_PATH} CACHE PATH "Single Directory for all Libraries")
set (CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE ${WX_OUTPUT_PATH} CACHE PATH "Single Directory for all static libraries.")

include(end)
#regex
include( regex )

#expat
include( expat )

#tiff
include( tiff )

#jpeg
include( jpeg )

#zlib
include( zlib )

#png
include( png )

#base
include( base )

#core
include( core )

#net
include( net )

#xml
include( xml )

#html
include( html )

#adv
include( adv )

#propgrid
include( propgrid )

#aui
include( aui )

