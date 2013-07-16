# Build a local version of GLM
include(ExternalProject)

set(glm_PREFIX ${PROJECT_BINARY_DIR}/glm)

set(glm_CMAKE_ARGS 
    -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
    -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
	-DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}
    -DCMAKE_OSX_ARCHITECTURES=${CMAKE_OSX_ARCHITECTURES}
)

ExternalProject_Add(glm
    PREFIX ${glm_PREFIX}
    
    DOWNLOAD_DIR ${CERBER_GAME_ENGINE_DEPS_DOWNLOAD_DIR}

    URL http://sourceforge.net/projects/ogl-math/files/glm-0.9.4.4/glm-0.9.4.4.zip
    URL_MD5 3118904f39befdb7063168316b6a33f1
	
	PATCH_COMMAND ${CMAKE_COMMAND} -E copy_if_different ${CERBERGameEngineDependencies_SOURCE_DIR}/../CMake/glm.cmake <SOURCE_DIR>/CMakeLists.txt

    INSTALL_DIR ${CERBER_GAME_ENGINE_DEPS_DIR} 
    CMAKE_ARGS ${glm_CMAKE_ARGS}
)
