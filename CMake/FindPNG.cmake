# - Try to find PNG
# Once done, this will define
#
#  PNG_FOUND - system has PNG
#  PNG_INCLUDE_DIR - the PNG include directory
#  PNG_LIBRARY - link this to use PNG

set(PNG_SEARCH_PATHS
	${CERBER_GAME_ENGINE_DEPS_DIR}/lib
	${CERBER_GAME_ENGINE_DEPS_DIR}/include
	${CERBER_GAME_ENGINE_DEPS_DIR}/include/libpng16
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

find_path(PNG_INCLUDE_DIR
	NAMES png.h
	HINTS
	NO_DEFAULT_PATH
	NO_CMAKE_ENVIRONMENT_PATH
	NO_CMAKE_SYSTEM_PATH
	NO_SYSTEM_ENVIRONMENT_PATH
	NO_CMAKE_PATH
	PATH_SUFFIXES include
	PATHS ${PNG_SEARCH_PATHS}
)

find_library(PNG_LIBRARY 
	NAMES png libpng png16 libpng16 libpng16_static
	HINTS
	NO_DEFAULT_PATH
	NO_CMAKE_ENVIRONMENT_PATH
	NO_CMAKE_SYSTEM_PATH
	NO_SYSTEM_ENVIRONMENT_PATH
	NO_CMAKE_PATH
	PATH_SUFFIXES lib lib64 win32/Dynamic_Release "Win32/${MSVC_YEAR_NAME}/x64/Release" "Win32/${MSVC_YEAR_NAME}/Win32/Release"
	PATHS ${PNG_SEARCH_PATHS}
)

# First search for d-suffixed libs
find_library(PNG_LIBRARY_DEBUG 
	NAMES pngd libpngd png16d libpng16d libpng16_staticd
	HINTS
	NO_DEFAULT_PATH
	NO_CMAKE_ENVIRONMENT_PATH
	NO_CMAKE_SYSTEM_PATH
	NO_SYSTEM_ENVIRONMENT_PATH
	NO_CMAKE_PATH
	PATH_SUFFIXES lib lib64 win32/Dynamic_Debug "Win32/${MSVC_YEAR_NAME}/x64/Debug" "Win32/${MSVC_YEAR_NAME}/Win32/Debug"
	PATHS ${PNG_SEARCH_PATHS}
)

if(NOT PNG_LIBRARY_DEBUG)
	# Then search for non suffixed libs if necessary, but only in debug dirs
	find_library(PNG_LIBRARY_DEBUG 
		NAMES png libpng png16 libpng16 libpng16_static
		HINTS
		NO_DEFAULT_PATH
		NO_CMAKE_ENVIRONMENT_PATH
		NO_CMAKE_SYSTEM_PATH
		NO_SYSTEM_ENVIRONMENT_PATH
		NO_CMAKE_PATH
		PATH_SUFFIXES win32/Dynamic_Debug "Win32/${MSVC_YEAR_NAME}/x64/Debug" "Win32/${MSVC_YEAR_NAME}/Win32/Debug"
		PATHS ${PNG_SEARCH_PATHS}
	)
endif()

if(PNG_LIBRARY)
	if(PNG_LIBRARY_DEBUG)
		set(PNG_LIBRARIES optimized "${PNG_LIBRARY}" debug "${PNG_LIBRARY_DEBUG}")
	else()
		set(PNG_LIBRARIES "${PNG_LIBRARY}")		# Could add "general" keyword, but it is optional
	endif()
endif()

# handle the QUIETLY and REQUIRED arguments and set XXX_FOUND to TRUE if all listed variables are TRUE
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(PNG DEFAULT_MSG PNG_LIBRARIES PNG_INCLUDE_DIR)