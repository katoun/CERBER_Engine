# Copied from http://code.google.com/p/osgaudio/source/browse/trunk/CMakeModules/FindVorbisFile.cmake
# Locate VorbisFile
# This module defines XXX_FOUND, XXX_INCLUDE_DIRS and XXX_LIBRARIES standard variables
#
# $VORBISDIR is an environment variable that would
# correspond to the ./configure --prefix=$VORBISDIR
# used in building Vorbis.

find_path(VORBISFILE_INCLUDE_DIR
	NAMES vorbis/vorbisfile.h
	HINTS
	$ENV{VORBISFILEDIR}
	$ENV{VORBISFILE_PATH}
	$ENV{VORBISDIR}
	$ENV{VORBIS_PATH}
	PATH_SUFFIXES include
	PATHS ${CERBER_GAME_ENGINE_DEPS_DIR}
)

find_library(VORBISFILE_LIBRARY 
	NAMES vorbisfile libvorbisfile
	HINTS
	NO_DEFAULT_PATH
	NO_CMAKE_ENVIRONMENT_PATH
	NO_CMAKE_SYSTEM_PATH
	NO_SYSTEM_ENVIRONMENT_PATH
	NO_CMAKE_PATH
	$ENV{VORBISFILEDIR}
	$ENV{VORBISFILE_PATH}
	$ENV{VORBISDIR}
	$ENV{VORBIS_PATH}
	PATH_SUFFIXES lib
	PATHS ${CERBER_GAME_ENGINE_DEPS_DIR}
)

# First search for d-suffixed libs
find_library(VORBISFILE_LIBRARY_DEBUG 
	NAMES vorbisfiled vorbisfile_d libvorbisfiled libvorbisfile_d
	HINTS
	NO_DEFAULT_PATH
	NO_CMAKE_ENVIRONMENT_PATH
	NO_CMAKE_SYSTEM_PATH
	NO_SYSTEM_ENVIRONMENT_PATH
	NO_CMAKE_PATH
	$ENV{VORBISFILEDIR}
	$ENV{VORBISFILE_PATH}
	$ENV{VORBISDIR}
	$ENV{VORBIS_PATH}
	PATH_SUFFIXES lib
	PATHS ${CERBER_GAME_ENGINE_DEPS_DIR}
)

if (NOT VORBISFILE_LIBRARY_DEBUG)
	# Then search for non suffixed libs if necessary, but only in debug dirs
	find_library(VORBISFILE_LIBRARY_DEBUG 
		NAMES vorbisfile libvorbisfile
		HINTS
		$ENV{VORBISFILEDIR}
		$ENV{VORBISFILE_PATH}
		$ENV{VORBISDIR}
		$ENV{VORBIS_PATH}
		PATH_SUFFIXES lib
		PATHS ${CERBER_GAME_ENGINE_DEPS_DIR}
	)
endif()


if (VORBISFILE_LIBRARY)
	if (VORBISFILE_LIBRARY_DEBUG)
		set(VORBISFILE_LIBRARIES optimized "${VORBISFILE_LIBRARY}" debug "${VORBISFILE_LIBRARY_DEBUG}")
	ELSE()
		set(VORBISFILE_LIBRARIES "${VORBISFILE_LIBRARY}")		# Could add "general" keyword, but it is optional
	endif()
endif()

# handle the QUIETLY and REQUIRED arguments and set XXX_FOUND to TRUE if all listed variables are TRUE
include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(VORBISFILE DEFAULT_MSG VORBISFILE_LIBRARIES VORBISFILE_INCLUDE_DIR)
