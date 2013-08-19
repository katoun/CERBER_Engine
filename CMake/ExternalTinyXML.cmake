# Build a local version of TinyXML
include(ExternalProject)

set(tinyXML_PREFIX ${PROJECT_BINARY_DIR}/tinyXML)

set(tinyXML_CMAKE_ARGS 
    -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
    -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
	-DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}
    -DCMAKE_OSX_ARCHITECTURES=${CMAKE_OSX_ARCHITECTURES}
	-DCMAKE_DEBUG_POSTFIX=d
)

ExternalProject_Add(tinyXML
    PREFIX ${tinyXML_PREFIX}
    
    DOWNLOAD_DIR ${CERBER_GAME_ENGINE_DEPS_DOWNLOAD_DIR}
	
	GIT_REPOSITORY https://github.com/leethomason/tinyxml2.git
	GIT_TAG 03238517b3718f0c977bb061747faa8ebfc4fb44
	
	PATCH_COMMAND ${CMAKE_COMMAND} -E copy_if_different ${CERBERGameEngineDependencies_SOURCE_DIR}/../CMake/tinyXML.cmake <SOURCE_DIR>/CMakeLists.txt

    INSTALL_DIR ${CERBER_GAME_ENGINE_DEPS_DIR}
    CMAKE_ARGS ${tinyXML_CMAKE_ARGS}
)
