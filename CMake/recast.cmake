cmake_minimum_required(VERSION 2.6)

project(RecastNavigation)
#set(RECAST_VERSION r129)

if(NOT CMAKE_BUILD_TYPE)
#	set(CMAKE_BUILD_TYPE "Debug")
	set(CMAKE_BUILD_TYPE "Release")
endif()

if(MSVC)
	option(USE_MSVC_FAST_FLOATINGPOINT "Use MSVC /fp:fast option" ON)
	if(USE_MSVC_FAST_FLOATINGPOINT)
		add_definitions(/fp:fast)
	endif()
	add_definitions(/D _CRT_SECURE_NO_WARNINGS)
endif()

add_subdirectory(DebugUtils)
add_subdirectory(Detour)
add_subdirectory(DetourCrowd)
add_subdirectory(DetourTileCache)
add_subdirectory(Recast)
