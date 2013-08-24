# - Try to find wxWidgets
# Once done, this will define
#
#  wxWidgets_FOUND - system has wxWidgets
#  wxWidgets_INCLUDE_DIR - the wxWidgets include directory
#  wxWidgets_LIBRARIES - link this to use wxWidgets

find_path(wxWidgets_INCLUDE_DIR
	NAMES wx/wx.h
	HINTS
	NO_DEFAULT_PATH
	NO_CMAKE_ENVIRONMENT_PATH
	NO_CMAKE_SYSTEM_PATH
	NO_SYSTEM_ENVIRONMENT_PATH
	NO_CMAKE_PATH
	PATH_SUFFIXES include
	PATHS ${CERBER_GAME_ENGINE_DEPS_DIR}
)

set(wxWidgets_LIBRARIES "")

foreach(LIB zlib png tiff jpeg expat regex)
    find_library(WX_${LIB}
		NAMES wx${LIB}
		HINTS
		NO_DEFAULT_PATH
		NO_CMAKE_ENVIRONMENT_PATH
		NO_CMAKE_SYSTEM_PATH
		NO_SYSTEM_ENVIRONMENT_PATH
		NO_CMAKE_PATH
		PATH_SUFFIXES lib
		PATHS ${CERBER_GAME_ENGINE_DEPS_DIR}
	)
	
	# First search for d-suffixed libs
	find_library(WX_${LIB}_DEBUG 
		NAMES wx${LIB}d
		HINTS
		NO_DEFAULT_PATH
		NO_CMAKE_ENVIRONMENT_PATH
		NO_CMAKE_SYSTEM_PATH
		NO_SYSTEM_ENVIRONMENT_PATH
		NO_CMAKE_PATH
		PATH_SUFFIXES lib
		PATHS ${CERBER_GAME_ENGINE_DEPS_DIR}
	)
	
	if(NOT WX_${LIB}_DEBUG)
		# Then search for non suffixed libs if necessary, but only in debug dirs
		find_library(WX_${LIB}_DEBUG
			NAMES wx${LIB}
			HINTS
			NO_DEFAULT_PATH
			NO_CMAKE_ENVIRONMENT_PATH
			NO_CMAKE_SYSTEM_PATH
			NO_SYSTEM_ENVIRONMENT_PATH
			NO_CMAKE_PATH
			PATH_SUFFIXES lib
			PATHS ${CERBER_GAME_ENGINE_DEPS_DIR}
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

find_library(WX_base 
	NAMES wxbase29u
	HINTS
	NO_DEFAULT_PATH
	NO_CMAKE_ENVIRONMENT_PATH
	NO_CMAKE_SYSTEM_PATH
	NO_SYSTEM_ENVIRONMENT_PATH
	NO_CMAKE_PATH
	PATH_SUFFIXES lib
	PATHS ${CERBER_GAME_ENGINE_DEPS_DIR}
)

# First search for d-suffixed libs
find_library(WX_base_DEBUG 
	NAMES wxbase29ud
	HINTS
	NO_DEFAULT_PATH
	NO_CMAKE_ENVIRONMENT_PATH
	NO_CMAKE_SYSTEM_PATH
	NO_SYSTEM_ENVIRONMENT_PATH
	NO_CMAKE_PATH
	PATH_SUFFIXES lib
	PATHS ${CERBER_GAME_ENGINE_DEPS_DIR}
)
	
if(NOT WX_base_DEBUG)
	# Then search for non suffixed libs if necessary, but only in debug dirs
	find_library(WX_base_DEBUG
		NAMES wxbase29ud
		HINTS
		NO_DEFAULT_PATH
		NO_CMAKE_ENVIRONMENT_PATH
		NO_CMAKE_SYSTEM_PATH
		NO_SYSTEM_ENVIRONMENT_PATH
		NO_CMAKE_PATH
		PATH_SUFFIXES lib
		PATHS ${CERBER_GAME_ENGINE_DEPS_DIR}
	)
endif()

if(WX_base)
	if(WX_base_DEBUG)
		list(APPEND wxWidgets_LIBRARIES optimized "${WX_base}" debug "${WX_base_DEBUG}")
	else()
		list(APPEND wxWidgets_LIBRARIES "${WX_base}")		# Could add "general" keyword, but it is optional
	endif()
endif()

foreach(LIB core adv aui propgrid)
    find_library(WX_${LIB}
		NAMES wxmsw29u_${LIB}
		HINTS
		NO_DEFAULT_PATH
		NO_CMAKE_ENVIRONMENT_PATH
		NO_CMAKE_SYSTEM_PATH
		NO_SYSTEM_ENVIRONMENT_PATH
		NO_CMAKE_PATH
		PATH_SUFFIXES lib
		PATHS ${CERBER_GAME_ENGINE_DEPS_DIR}
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
		PATH_SUFFIXES lib
		PATHS ${CERBER_GAME_ENGINE_DEPS_DIR}
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
			PATH_SUFFIXES lib
			PATHS ${CERBER_GAME_ENGINE_DEPS_DIR}
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

## add system libraries wxWidgets always seems to depend on
if(WIN32)
	list(APPEND wxWidgets_LIBRARIES winmm comctl32 rpcrt4 wsock32)
endif()

# handle the QUIETLY and REQUIRED arguments and set XXX_FOUND to TRUE if all listed variables are TRUE
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(wxWidgets DEFAULT_MSG wxWidgets_LIBRARIES wxWidgets_INCLUDE_DIR)