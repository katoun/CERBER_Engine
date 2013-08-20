# Build a local version of Recast
include(ExternalProject)

set(reacast_PREFIX ${PROJECT_BINARY_DIR}/recast)

set(recast_CMAKE_ARGS 
    -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
    -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
	-DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}
    -DCMAKE_OSX_ARCHITECTURES=${CMAKE_OSX_ARCHITECTURES}
)

ExternalProject_Add(recast
    PREFIX ${recast_PREFIX}
    
    DOWNLOAD_DIR ${CERBER_GAME_ENGINE_DEPS_DOWNLOAD_DIR}

	SVN_REPOSITORY http://recastnavigation.googlecode.com/svn/trunk
	SVN_REVISION -r "351"
	
	PATCH_COMMAND ${CMAKE_COMMAND} -E copy_if_different ${CERBERGameEngineDependencies_SOURCE_DIR}/../CMake/recast.cmake <SOURCE_DIR>/CMakeLists.txt && ${CMAKE_COMMAND} -E copy_if_different ${CERBERGameEngineDependencies_SOURCE_DIR}/../CMake/recast_patch/Detour/CMakeLists.cmake <SOURCE_DIR>/Detour/CMakeLists.txt && ${CMAKE_COMMAND} -E copy_if_different ${CERBERGameEngineDependencies_SOURCE_DIR}/../CMake/recast_patch/DetourCrowd/CMakeLists.cmake <SOURCE_DIR>/DetourCrowd/CMakeLists.txt && ${CMAKE_COMMAND} -E copy_if_different ${CERBERGameEngineDependencies_SOURCE_DIR}/../CMake/recast_patch/DetourTileCache/CMakeLists.cmake <SOURCE_DIR>/DetourTileCache/CMakeLists.txt && ${CMAKE_COMMAND} -E copy_if_different ${CERBERGameEngineDependencies_SOURCE_DIR}/../CMake/recast_patch/Recast/CMakeLists.cmake <SOURCE_DIR>/Recast/CMakeLists.txt

    INSTALL_DIR ${CERBER_GAME_ENGINE_DEPS_DIR} 
    CMAKE_ARGS ${recast_CMAKE_ARGS}
)
