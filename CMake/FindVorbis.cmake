# Copied from http://code.google.com/p/osgaudio/source/browse/trunk/CMakeModules/FindVorbis.cmake
# Locate Vorbis
# This module defines XXX_FOUND, XXX_INCLUDE_DIRS and XXX_LIBRARIES standard variables
#
# $VORBISDIR is an environment variable that would
# correspond to the ./configure --prefix=$VORBISDIR
# used in building Vorbis.

find_path(VORBIS_INCLUDE_DIR
	NAMES vorbis/codec.h
	HINTS
	$ENV{VORBISDIR}
	$ENV{VORBIS_PATH}
	PATH_SUFFIXES include
	PATHS ${CERBER_GAME_ENGINE_DEPS_DIR}
)

find_library(VORBIS_LIBRARY 
	NAMES vorbis libvorbis
	HINTS
	NO_DEFAULT_PATH
	NO_CMAKE_ENVIRONMENT_PATH
	NO_CMAKE_SYSTEM_PATH
	NO_SYSTEM_ENVIRONMENT_PATH
	NO_CMAKE_PATH
	$ENV{VORBISDIR}
	$ENV{VORBIS_PATH}
	PATH_SUFFIXES lib
	PATHS ${CERBER_GAME_ENGINE_DEPS_DIR}
)

# First search for d-suffixed libs
find_library(VORBIS_LIBRARY_DEBUG 
	NAMES vorbisd vorbis_d libvorbisd libvorbis_d
	HINTS
	NO_DEFAULT_PATH
	NO_CMAKE_ENVIRONMENT_PATH
	NO_CMAKE_SYSTEM_PATH
	NO_SYSTEM_ENVIRONMENT_PATH
	NO_CMAKE_PATH
	$ENV{VORBISDIR}
	$ENV{VORBIS_PATH}
	PATH_SUFFIXES lib
	PATHS ${CERBER_GAME_ENGINE_DEPS_DIR}
)

if(NOT VORBIS_LIBRARY_DEBUG)
	# Then search for non suffixed libs if necessary, but only in debug dirs
	find_library(VORBIS_LIBRARY_DEBUG 
		NAMES vorbis libvorbis
		HINTS
		NO_DEFAULT_PATH
		NO_CMAKE_ENVIRONMENT_PATH
		NO_CMAKE_SYSTEM_PATH
		NO_SYSTEM_ENVIRONMENT_PATH
		$ENV{VORBISDIR}
		$ENV{VORBIS_PATH}
		PATH_SUFFIXES lib
		PATHS ${CERBER_GAME_ENGINE_DEPS_DIR}
	)
endif()

if(VORBIS_LIBRARY)
	if(VORBIS_LIBRARY_DEBUG)
		set(VORBIS_LIBRARIES optimized "${VORBIS_LIBRARY}" debug "${VORBIS_LIBRARY_DEBUG}")
	else()
		set(VORBIS_LIBRARIES "${VORBIS_LIBRARY}")		# Could add "general" keyword, but it is optional
	endif()
endif()

# handle the QUIETLY and REQUIRED arguments and set XXX_FOUND to TRUE if all listed variables are TRUE
include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(VORBIS DEFAULT_MSG VORBIS_LIBRARIES VORBIS_INCLUDE_DIR)
