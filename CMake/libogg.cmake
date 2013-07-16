# CMakeLists.txt to build static libogg for The Game Engine
cmake_minimum_required(VERSION 2.6)

project(libogg C)

if(NOT CMAKE_BUILD_TYPE)
    #set(CMAKE_BUILD_TYPE "Debug")
    set(CMAKE_BUILD_TYPE "Release")
endif()

# to distinguish between debug and release lib
set(CMAKE_DEBUG_POSTFIX "d")

set(libogg_SRCS src/bitwise.c src/framing.c)
set(libogg_HDRS include/ogg/ogg.h include/ogg/os_types.h)

include_directories(include)

if(MSVC)
    add_definitions(/D_UNICODE /DUNICODE)
    LIST(APPEND libogg_SRCS win32/ogg.def)
endif()

if("${CMAKE_SYSTEM_NAME}" STREQUAL "Linux")
	# libogg expects configure to be called on linux to
	# generate config_types.h
    list(APPEND libogg_HDRS include/ogg/config_types.h)

	add_custom_command(OUTPUT include/ogg/config_types.h
						COMMAND ./configure
						DEPENDS include/ogg/ogg.h # Hopefully if the libogg version changes, so does this file
												  # so configure_types.h will be regenerated.
						WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
					   )
endif()

#add_library(libogg_dynamic SHARED ${libogg_SRCS} ${libogg_HDRS})
add_library(libogg ${libogg_SRCS} ${libogg_HDRS})

#SET_TARGET_PROPERTIES(libogg_dynamic #libogg_static 
#    PROPERTIES OUTPUT_NAME libogg)

install(TARGETS libogg #libogg_dynamic
    RUNTIME DESTINATION bin
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib)

install(FILES ${libogg_HDRS} DESTINATION include/ogg)

