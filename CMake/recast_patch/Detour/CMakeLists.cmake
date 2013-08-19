cmake_minimum_required(VERSION 2.6)

set(detour_SRCS
	Source/DetourAlloc.cpp
	Source/DetourCommon.cpp
	Source/DetourNavMesh.cpp
	Source/DetourNavMeshBuilder.cpp
	Source/DetourNavMeshQuery.cpp
	Source/DetourNode.cpp
)

set(detour_HDRS
	Include/DetourAlloc.h
	Include/DetourAssert.h
	Include/DetourCommon.h
	Include/DetourNavMesh.h
	Include/DetourNavMeshBuilder.h
	Include/DetourNavMeshQuery.h
	Include/DetourNode.h
)

include_directories(Include)

add_library(Detour ${detour_SRCS} ${detour_HDRS})

install(TARGETS 
    Detour #Detour_dynamic
    RUNTIME DESTINATION bin
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib)

install(FILES ${detour_HDRS} DESTINATION include/Detour)
