# Based on http://freya3d.org/browser/CMakeFind/FindAssimp.cmake
# Based on http://www.daimi.au.dk/~cgd/code/extensions/Assimp/FindAssimp.cmake
# - Try to find Assimp
# Once done this will define
#
#  ASSIMP_FOUND - system has Assimp
#  ASSIMP_INCLUDE_DIR - the Assimp include directory
#  ASSIMP_LIBRARY - Link these to use Assimp
#  ASSIMP_LIBRARIES

set(ASSIMP_SEARCH_PATHS
	${CERBER_GAME_ENGINE_DEPS_DIR}/lib
	${CERBER_GAME_ENGINE_DEPS_DIR}/include
)

find_path(ASSIMP_INCLUDE_DIR
	NAMES assimp/assimp.h
	HINTS
	NO_DEFAULT_PATH
	NO_CMAKE_ENVIRONMENT_PATH
	NO_CMAKE_SYSTEM_PATH
	NO_SYSTEM_ENVIRONMENT_PATH
	NO_CMAKE_PATH
	CMAKE_FIND_FRAMEWORK NEVER
	PATH_SUFFIXES include
	PATHS ${CERBER_GAME_ENGINE_DEPS_DIR}
)
 
find_library(ASSIMP_LIBRARY_DEBUG
		NAMES assimpd libassimpd libassimp_d
		PATH_SUFFIXES lib
		PATHS ${CERBER_GAME_ENGINE_DEPS_DIR}
		)
		
find_library(ASSIMP_LIBRARY_RELEASE
		NAMES assimp libassimp
		PATH_SUFFIXES lib
		PATHS ${CERBER_GAME_ENGINE_DEPS_DIR}
		)

if (ASSIMP_INCLUDE_DIR AND ASSIMP_LIBRARY_RELEASE)
	set(ASSIMP_FOUND TRUE)
endif()

if(ASSIMP_LIBRARY_RELEASE)
	set(ASSIMP_LIBRARY ${ASSIMP_LIBRARY_RELEASE})
endif()

if(ASSIMP_LIBRARY_DEBUG AND ASSIMP_LIBRARY_RELEASE)
	set(ASSIMP_LIBRARY debug ${ASSIMP_LIBRARY_DEBUG} optimized ${ASSIMP_LIBRARY_RELEASE} )
endif()

if(ASSIMP_FOUND)
	message("-- Found Assimp ${ASSIMP_LIBRARIES}")
	mark_as_advanced(ASSIMP_INCLUDE_DIR ASSIMP_LIBRARY ASSIMP_LIBRARIES)
endif()


