# Build a local version of libogg, libvorbis and libvorbisfile
include(ExternalProject)

set(oggvorbis_DIR ${CMAKE_CURRENT_BINARY_DIR}/oggvorbis)

set(oggvorbis_CMAKE_ARGS
    -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR> 
    -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
	-DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}
    -DCMAKE_OSX_ARCHITECTURES=${CMAKE_OSX_ARCHITECTURES}
)

EXTERNALPROJECT_ADD(libogg
    PREFIX ${oggvorbis_DIR}

    DOWNLOAD_DIR ${CERBER_GAME_ENGINE_DEPS_DOWNLOAD_DIR}
    URL http://downloads.xiph.org/releases/ogg/libogg-1.2.2.tar.gz
    URL_MD5 5a9fcabc9a1b7c6f1cd75ddc78f36c56

    PATCH_COMMAND ${CMAKE_COMMAND} -E copy_if_different ${CERBERGameEngineDependencies_SOURCE_DIR}/../CMake/libogg.cmake <SOURCE_DIR>/CMakeLists.txt

    INSTALL_DIR ${CERBER_GAME_ENGINE_DEPS_DIR}
    CMAKE_ARGS ${oggvorbis_CMAKE_ARGS}
)

ExternalProject_Get_Property(libogg install_dir)

# Kludge: Shouldn't be necessary if FIND_LIBRARY were working on mingw.
if (MINGW)
	set(oggvorbis_CMAKE_ARGS ${oggvorbis_CMAKE_ARGS}
		-DOGG_LIBRARY=libogg
		-DOGG_INCLUDE_DIR=${install_dir}/include
	)
endif()

EXTERNALPROJECT_ADD(libvorbis
    DEPENDS libogg
    PREFIX ${oggvorbis_DIR}

    DOWNLOAD_DIR ${CERBER_GAME_ENGINE_DEPS_DOWNLOAD_DIR}
    URL http://downloads.xiph.org/releases/vorbis/libvorbis-1.3.2.tar.gz
    URL_MD5 c870b9bd5858a0ecb5275c14486d9554

    PATCH_COMMAND ${CMAKE_COMMAND} -E copy_if_different ${CERBERGameEngineDependencies_SOURCE_DIR}/../CMake/libvorbis.cmake <SOURCE_DIR>/CMakeLists.txt

    INSTALL_DIR ${CERBER_GAME_ENGINE_DEPS_DIR}
    CMAKE_ARGS ${oggvorbis_CMAKE_ARGS} -DCMAKE_PREFIX_PATH=${install_dir} # to find libogg
)
