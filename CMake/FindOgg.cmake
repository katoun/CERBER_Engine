# Copied from http://code.google.com/p/osgaudio/source/browse/trunk/CMakeModules/FindOGG.cmake
# Locate OGG
# This module defines XXX_FOUND, XXX_INCLUDE_DIRS and XXX_LIBRARIES standard variables
#
# $OGGDIR is an environment variable that would
# correspond to the ./configure --prefix=$OGGDIR
# used in building OGG.

find_path(OGG_INCLUDE_DIR
	NAMES ogg/ogg.h ogg/os_types.h
	HINTS
	$ENV{OGGDIR}
	$ENV{OGG_PATH}
	PATH_SUFFIXES include
	PATHS ${CERBER_GAME_ENGINE_DEPS_DIR}
)

find_library(OGG_LIBRARY 
	NAMES ogg libogg liblibogg
	HINTS
	NO_DEFAULT_PATH
	NO_CMAKE_ENVIRONMENT_PATH
	NO_CMAKE_SYSTEM_PATH
	NO_SYSTEM_ENVIRONMENT_PATH
	NO_CMAKE_PATH
	CMAKE_FIND_FRAMEWORK NEVER
	$ENV{OGGDIR}
	$ENV{OGG_PATH}
	PATH_SUFFIXES lib
	PATHS ${CERBER_GAME_ENGINE_DEPS_DIR}
)

# First search for d-suffixed libs
find_library(OGG_LIBRARY_DEBUG 
	NAMES oggd ogg_d liboggd libogg_d liblibogg_d
	HINTS
	NO_DEFAULT_PATH
	NO_CMAKE_ENVIRONMENT_PATH
	NO_CMAKE_SYSTEM_PATH
	NO_SYSTEM_ENVIRONMENT_PATH
	NO_CMAKE_PATH
	CMAKE_FIND_FRAMEWORK NEVER
	$ENV{OGGDIR}
	$ENV{OGG_PATH}
	PATH_SUFFIXES lib
	PATHS ${CERBER_GAME_ENGINE_DEPS_DIR}
)

if(NOT OGG_LIBRARY_DEBUG)
	# Then search for non suffixed libs if necessary, but only in debug dirs
	find_library(OGG_LIBRARY_DEBUG 
		NAMES ogg libogg liblibogg
		HINTS
		NO_DEFAULT_PATH
		NO_CMAKE_ENVIRONMENT_PATH
		NO_CMAKE_SYSTEM_PATH
		NO_SYSTEM_ENVIRONMENT_PATH
		NO_CMAKE_PATH
		CMAKE_FIND_FRAMEWORK NEVER
		$ENV{OGGDIR}
		$ENV{OGG_PATH}
		PATH_SUFFIXES lib
		PATHS ${CERBER_GAME_ENGINE_DEPS_DIR}
	)
endif()


if(OGG_LIBRARY)
	if(OGG_LIBRARY_DEBUG)
		set(OGG_LIBRARIES optimized "${OGG_LIBRARY}" debug "${OGG_LIBRARY_DEBUG}")
	else()
		set(OGG_LIBRARIES "${OGG_LIBRARY}")		# Could add "general" keyword, but it is optional
	endif()
endif()

# handle the QUIETLY and REQUIRED arguments and set XXX_FOUND to TRUE if all listed variables are TRUE
include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(OGG DEFAULT_MSG OGG_LIBRARIES OGG_INCLUDE_DIR)
