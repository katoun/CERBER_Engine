cmake_minimum_required(VERSION 2.6)

set(detourcrowd_SRCS
	Source/DetourPathCorridor.cpp
	Source/DetourLocalBoundary.cpp
	Source/DetourObstacleAvoidance.cpp
	Source/DetourPathQueue.cpp
	Source/DetourCrowd.cpp
	Source/DetourProximityGrid.cpp
)

set(detourcrowd_HDRS
	Include/DetourPathCorridor.h
	Include/DetourCrowd.h
	Include/DetourObstacleAvoidance.h
	Include/DetourLocalBoundary.h
	Include/DetourProximityGrid.h
	Include/DetourPathQueue.h
)

include_directories(Include 
	../Detour/Include
	../DetourTileCache
	../Recast/Include
)

add_library(DetourCrowd ${detourcrowd_SRCS} ${detourcrowd_HDRS})

install(TARGETS 
    DetourCrowd #DetourCrowd_dynamic
    RUNTIME DESTINATION bin
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib)

install(FILES ${detourcrowd_HDRS} DESTINATION include/DetourCrowd)
