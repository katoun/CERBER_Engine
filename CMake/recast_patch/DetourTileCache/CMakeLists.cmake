cmake_minimum_required(VERSION 2.6)

set(detourtilecache_SRCS 
	Source/DetourTileCache.cpp
	Source/DetourTileCacheBuilder.cpp
)

set(detourtilecache_HDRS
	Include/DetourTileCache.h
	Include/DetourTileCacheBuilder.h
)

include_directories(Include 
	../Detour/Include
	../Recast/Include
)

add_library(DetourTileCache ${detourtilecache_SRCS} ${detourtilecache_HDRS})

install(TARGETS 
    DetourTileCache #DetourTileCache_dynamic
    RUNTIME DESTINATION bin
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib)

install(FILES ${detourtilecache_HDRS} DESTINATION include/DetourTileCache)
