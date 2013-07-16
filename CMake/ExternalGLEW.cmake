# Build a local version of glew
include(ExternalProject)

set(glew_PREFIX ${PROJECT_BINARY_DIR}/glew)

set(glew_CMAKE_ARGS 
    -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
    -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
	-DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}
    -DCMAKE_OSX_ARCHITECTURES=${CMAKE_OSX_ARCHITECTURES}
)

ExternalProject_Add(glew
    PREFIX ${glew_PREFIX}
    
    DOWNLOAD_DIR ${CERBER_GAME_ENGINE_DEPS_DOWNLOAD_DIR}

    URL http://sourceforge.net/projects/glew/files/glew/1.9.0/glew-1.9.0.tgz
    URL_MD5 69ce911decef6249d24742497e6ad06a
	
	PATCH_COMMAND ${CMAKE_COMMAND} -E copy_if_different ${CERBERGameEngineDependencies_SOURCE_DIR}/../CMake/glew.cmake <SOURCE_DIR>/CMakeLists.txt && ${CMAKE_COMMAND} -E copy_if_different ${CERBERGameEngineDependencies_SOURCE_DIR}/../CMake/glew_patch/glew.rc <SOURCE_DIR>/build/glew.rc

    INSTALL_DIR ${CERBER_GAME_ENGINE_DEPS_DIR} 
    CMAKE_ARGS ${glew_CMAKE_ARGS}
)
