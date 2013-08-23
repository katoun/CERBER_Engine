# Build a local version of wxwidgets
include(ExternalProject)

set(wxwidgets_PREFIX ${PROJECT_BINARY_DIR}/wxwidgets)

set(wxwidgets_CMAKE_ARGS 
    -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
    -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
	-DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}
    -DCMAKE_OSX_ARCHITECTURES=${CMAKE_OSX_ARCHITECTURES}
	-DCMAKE_DEBUG_POSTFIX=d
)

ExternalProject_Add(wxwidgets
    PREFIX ${wxwidgets_PREFIX}
    
    DOWNLOAD_DIR ${CERBER_GAME_ENGINE_DEPS_DOWNLOAD_DIR}

    URL http://sourceforge.net/projects/wxwindows/files/2.9.4/wxWidgets-2.9.4.zip
    URL_MD5 35589383078944723fd64e7e584f00d8
	
	PATCH_COMMAND ${CMAKE_COMMAND} -E copy_if_different ${CERBERGameEngineDependencies_SOURCE_DIR}/../CMake/wxwidgets.cmake <SOURCE_DIR>/CMakeLists.txt && ${CMAKE_COMMAND} -E copy_directory ${CERBERGameEngineDependencies_SOURCE_DIR}/../CMake/wxwidgets_patch <SOURCE_DIR>

    INSTALL_DIR ${CERBER_GAME_ENGINE_DEPS_DIR}
    CMAKE_ARGS ${wxwidgets_CMAKE_ARGS}
)
