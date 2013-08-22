# Build a local version of glfw
include(ExternalProject)

set(glfw_PREFIX ${PROJECT_BINARY_DIR}/glfw)

set(glfw_CMAKE_ARGS 
    -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
    -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
	-DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}
    -DCMAKE_OSX_ARCHITECTURES=${CMAKE_OSX_ARCHITECTURES}
	-DCMAKE_DEBUG_POSTFIX=d
)

ExternalProject_Add(glfw
    PREFIX ${glfw_PREFIX}
    
    DOWNLOAD_DIR ${CERBER_GAME_ENGINE_DEPS_DOWNLOAD_DIR}

    URL http://sourceforge.net/projects/glfw/files/glfw/3.0.1/glfw-3.0.1.zip
    URL_MD5 f018324047650461f18b17e39212184f
	
	PATCH_COMMAND ${CMAKE_COMMAND} -E copy_if_different ${CERBERGameEngineDependencies_SOURCE_DIR}/../CMake/glfw.cmake <SOURCE_DIR>/CMakeLists.txt

    INSTALL_DIR ${CERBER_GAME_ENGINE_DEPS_DIR} 
    CMAKE_ARGS ${glfw_CMAKE_ARGS}
)
