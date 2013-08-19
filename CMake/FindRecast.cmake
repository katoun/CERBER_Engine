# - Try to find RECAST
# Once done, this will define
#
#  RECAST_FOUND - system has RECAST
#  RECAST_INCLUDE_DIR - the RECAST include directory
#  RECAST_LIBRARY - link this to use RECAST

set(RECAST_SEARCH_PATHS
	${CERBER_GAME_ENGINE_DEPS_DIR}/lib
	${CERBER_GAME_ENGINE_DEPS_DIR}/include/Recast
)

set(MSVC_YEAR_NAME)
IF (MSVC_VERSION GREATER 1599)		# >= 1600
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

find_path(RECAST_INCLUDE_DIR
	NAMES Recast.h
	HINTS
	NO_DEFAULT_PATH
	NO_CMAKE_ENVIRONMENT_PATH
	NO_CMAKE_SYSTEM_PATH
	NO_SYSTEM_ENVIRONMENT_PATH
	NO_CMAKE_PATH
	PATH_SUFFIXES include
	PATHS ${RECAST_SEARCH_PATHS}
)

find_library(RECAST_LIBRARY 
	NAMES Recast
	HINTS
	NO_DEFAULT_PATH
	NO_CMAKE_ENVIRONMENT_PATH
	NO_CMAKE_SYSTEM_PATH
	NO_SYSTEM_ENVIRONMENT_PATH
	NO_CMAKE_PATH
	PATH_SUFFIXES lib lib64 win32/Dynamic_Debug "Win32/${MSVC_YEAR_NAME}/x64/Debug" "Win32/${MSVC_YEAR_NAME}/Win32/Debug"
	PATHS ${RECAST_SEARCH_PATHS}
)

# handle the QUIETLY and REQUIRED arguments and set XXX_FOUND to TRUE if all listed variables are TRUE
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(RECAST DEFAULT_MSG RECAST_LIBRARY RECAST_INCLUDE_DIR)