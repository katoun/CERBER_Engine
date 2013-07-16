# Copied from http://code.google.com/p/osgaudio/source/browse/trunk/CMakeModules/FindVorbisFile.cmake
# Locate VorbisFile
# This module defines XXX_FOUND, XXX_INCLUDE_DIRS and XXX_LIBRARIES standard variables
#
# $VORBISDIR is an environment variable that would
# correspond to the ./configure --prefix=$VORBISDIR
# used in building Vorbis.

set(VORBISFILE_SEARCH_PATHS
	${CERBER_GAME_ENGINE_DEPS_DIR}/lib
	${CERBER_GAME_ENGINE_DEPS_DIR}/include
)

set(MSVC_YEAR_NAME)
if (MSVC_VERSION GREATER 1599)		# >= 1600
	set(MSVC_YEAR_NAME VS2010)
elseif(MSVC_VERSION GREATER 1499)	# >= 1500
	set(MSVC_YEAR_NAME VS2008)
elseif(MSVC_VERSION GREATER 1399)	# >= 1400
	set(MSVC_YEAR_NAME VS2005)
elseif(MSVC_VERSION GREATER 1299)	# >= 1300
	set(MSVC_YEAR_NAME VS2003)
elseif(MSVC_VERSION GREATER 1199)	# >= 1200
	set(MSVC_YEAR_NAME VS6)
endif()

find_path(VORBISFILE_INCLUDE_DIR
	NAMES vorbis/vorbisfile.h
	HINTS
	$ENV{VORBISFILEDIR}
	$ENV{VORBISFILE_PATH}
	$ENV{VORBISDIR}
	$ENV{VORBIS_PATH}
	PATH_SUFFIXES include
	PATHS ${VORBISFILE_SEARCH_PATHS}
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
	PATH_SUFFIXES lib lib64 win32/VorbisFile_Dynamic_Release "Win32/${MSVC_YEAR_NAME}/x64/Release" "Win32/${MSVC_YEAR_NAME}/Win32/Release"
	PATHS ${VORBISFILE_SEARCH_PATHS}
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
	PATH_SUFFIXES lib lib64 win32/VorbisFile_Dynamic_Debug "Win32/${MSVC_YEAR_NAME}/x64/Debug" "Win32/${MSVC_YEAR_NAME}/Win32/Debug"
	PATHS ${VORBISFILE_SEARCH_PATHS}
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
		PATH_SUFFIXES win32/VorbisFile_Dynamic_Debug "Win32/${MSVC_YEAR_NAME}/x64/Debug" "Win32/${MSVC_YEAR_NAME}/Win32/Debug"
		PATHS ${VORBISFILE_SEARCH_PATHS}
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
