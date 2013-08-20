# Build a local version of zlib and libpng
include(ExternalProject)

set(libpng_PREFIX ${CMAKE_CURRENT_BINARY_DIR}/libpng)

set(libpng_CMAKE_ARGS
    -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR> 
    -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
	-DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}
    -DCMAKE_OSX_ARCHITECTURES=${CMAKE_OSX_ARCHITECTURES}
    -DPNG_SHARED=OFF
	-DPNG_STATIC=ON
    -DBUILD_SHARED_LIBS=FALSE
    -DSKIP_INSTALL_FILES=1
)

EXTERNALPROJECT_ADD(zlib
    PREFIX ${libpng_PREFIX}

    DOWNLOAD_DIR ${CERBER_GAME_ENGINE_DEPS_DOWNLOAD_DIR}
    URL http://zlib.net/zlib-1.2.8.tar.gz
    URL_MD5 44d667c142d7cda120332623eab69f40

    PATCH_COMMAND ${CMAKE_COMMAND} -E copy_if_different ${CERBERGameEngineDependencies_SOURCE_DIR}/../CMake/zlib.cmake <SOURCE_DIR>/CMakeLists.txt && ${CMAKE_COMMAND} -E remove <SOURCE_DIR>/zconf.h

    INSTALL_DIR ${CERBER_GAME_ENGINE_DEPS_DIR}
    CMAKE_ARGS ${libpng_CMAKE_ARGS}
)

ExternalProject_Get_Property(zlib install_dir)

# Kludge: Shouldn't be necessary if FIND_LIBRARY were working on mingw.
if (MINGW)
	set(libpng_CMAKE_ARGS ${libpng_CMAKE_ARGS}
		-DZLIB_LIBRARY=zlib
		-DZLIB_INCLUDE_DIR=${install_dir}/include
	)
endif()

EXTERNALPROJECT_ADD(libpng
    DEPENDS zlib
    PREFIX ${libpng_PREFIX}

    DOWNLOAD_DIR ${CERBER_GAME_ENGINE_DEPS_DOWNLOAD_DIR}
    URL ftp://ftp.simplesystems.org/pub/libpng/png/src/history/libpng16/libpng-1.6.2.tar.gz
    URL_MD5 b9f33116aafde244d04caf1ee19eb573

    INSTALL_DIR ${CERBER_GAME_ENGINE_DEPS_DIR}
    CMAKE_ARGS ${libpng_CMAKE_ARGS} -DCMAKE_PREFIX_PATH=${install_dir} # to find zlib
)
