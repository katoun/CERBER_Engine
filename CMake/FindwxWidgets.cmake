# - Try to find wxWidgets
# Once done, this will define
#
#  wxWidgets_FOUND - system has wxWidgets
#  wxWidgets_INCLUDE_DIR - the wxWidgets include directory
#  wxWidgets_LIBRARIES - link this to use wxWidgets

set(WXWIDGETS_SEARCH_PATHS
	${CERBER_GAME_ENGINE_DEPS_DIR}/lib
	${CERBER_GAME_ENGINE_DEPS_DIR}/include
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

find_path(wxWidgets_INCLUDE_DIR
	NAMES wx/wx.h
	HINTS
	NO_DEFAULT_PATH
	NO_CMAKE_ENVIRONMENT_PATH
	NO_CMAKE_SYSTEM_PATH
	NO_SYSTEM_ENVIRONMENT_PATH
	NO_CMAKE_PATH
	PATH_SUFFIXES include
	PATHS ${WXWIDGETS_SEARCH_PATHS}
)

find_library(WX_base 
	NAMES wxbase29u
	HINTS
	NO_DEFAULT_PATH
	NO_CMAKE_ENVIRONMENT_PATH
	NO_CMAKE_SYSTEM_PATH
	NO_SYSTEM_ENVIRONMENT_PATH
	NO_CMAKE_PATH
	PATH_SUFFIXES lib lib64 win32/Dynamic_Release "Win32/${MSVC_YEAR_NAME}/x64/Debug" "Win32/${MSVC_YEAR_NAME}/Win32/Debug"
	PATHS ${WXWIDGETS_SEARCH_PATHS}
)

set(wxWidgets_LIBRARIES "")

foreach(LIB core adv aui propgrid)
    find_library(WX_${LIB}
		NAMES wxmsw29u_${LIB}
		HINTS
		NO_DEFAULT_PATH
		NO_CMAKE_ENVIRONMENT_PATH
		NO_CMAKE_SYSTEM_PATH
		NO_SYSTEM_ENVIRONMENT_PATH
		NO_CMAKE_PATH
		PATH_SUFFIXES lib lib64 win32/Dynamic_Release "Win32/${MSVC_YEAR_NAME}/x64/Debug" "Win32/${MSVC_YEAR_NAME}/Win32/Debug"
		PATHS ${WXWIDGETS_SEARCH_PATHS}
	)
	
	# First search for d-suffixed libs
	find_library(WX_${LIB}_DEBUG 
		NAMES wxmsw29ud_${LIB}
		HINTS
		NO_DEFAULT_PATH
		NO_CMAKE_ENVIRONMENT_PATH
		NO_CMAKE_SYSTEM_PATH
		NO_SYSTEM_ENVIRONMENT_PATH
		NO_CMAKE_PATH
		PATH_SUFFIXES lib lib64 win32/Dynamic_Debug "Win32/${MSVC_YEAR_NAME}/x64/Debug" "Win32/${MSVC_YEAR_NAME}/Win32/Debug"
		PATHS ${WXWIDGETS_SEARCH_PATHS}
	)
	
	if(NOT WX_${LIB}_DEBUG)
		# Then search for non suffixed libs if necessary, but only in debug dirs
		find_library(WX_${LIB}_DEBUG
			NAMES wxmsw29u_${LIB}
			HINTS
			NO_DEFAULT_PATH
			NO_CMAKE_ENVIRONMENT_PATH
			NO_CMAKE_SYSTEM_PATH
			NO_SYSTEM_ENVIRONMENT_PATH
			NO_CMAKE_PATH
			PATH_SUFFIXES win32/Dynamic_Debug "Win32/${MSVC_YEAR_NAME}/x64/Debug" "Win32/${MSVC_YEAR_NAME}/Win32/Debug"
			PATHS ${WXWIDGETS_SEARCH_PATHS}
		)
	endif()
	
	if(WX_${LIB})
		if(WX_${LIB}_DEBUG)
			list(APPEND wxWidgets_LIBRARIES optimized "${WX_${LIB}}" debug "${WX_${LIB}_DEBUG}")
		else()
			list(APPEND wxWidgets_LIBRARIES "${WX_${LIB}}")		# Could add "general" keyword, but it is optional
	endif()
endif()
	
endforeach()

# handle the QUIETLY and REQUIRED arguments and set XXX_FOUND to TRUE if all listed variables are TRUE
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(wxWidgets DEFAULT_MSG wxWidgets_LIBRARIES wxWidgets_INCLUDE_DIR)