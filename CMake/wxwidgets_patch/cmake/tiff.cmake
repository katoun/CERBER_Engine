set(PROJECT_NAME tiff)

set(TIFFLIB_NAME wxtiff)

set(LIB_CSOURCES
	${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_aux.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_close.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_codec.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_color.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_compress.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_dir.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_dirinfo.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_dirread.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_dirwrite.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_dumpmode.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_error.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_extension.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_fax3.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_fax3sm.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_flush.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_getimage.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_jpeg.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_luv.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_lzw.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_next.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_ojpeg.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_open.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_packbits.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_pixarlog.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_predict.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_print.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_read.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_strip.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_swab.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_thunder.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_tile.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_version.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_warning.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_write.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_zip.c	
    )
	
if(WIN32)
	list(APPEND ${LIB_CSOURCES} ${CMAKE_CURRENT_SOURCE_DIR}/src/tiff/libtiff/tif_win32.c)	
endif()

source_group("Source Files" FILES ${LIB_CSOURCES})

set( PROJECT_CSOURCES ${LIB_CSOURCES} )

if(WIN32)
  # Postfix of DLLs:
  set(TIFFLIB_DEBUG_POSTFIX d)
else()
  # Postfix of so's:
  set(TIFFLIB_DEBUG_POSTFIX)
endif()

add_library(${TIFFLIB_NAME} STATIC ${PROJECT_CSOURCES})

if(MSVC)
    if(CMAKE_CL_64)
        set_target_properties(${TIFFLIB_NAME} PROPERTIES STATIC_LIBRARY_FLAGS "/machine:x64")
    endif()
endif()

set_target_properties(${TIFFLIB_NAME}
	PROPERTIES OUTPUT_NAME "${TIFFLIB_NAME}"
    LINKER_LANGUAGE CXX
	DEBUG_POSTFIX "${TIFFLIB_DEBUG_POSTFIX}"
    PROJECT_LABEL ${PROJECT_NAME}
    COMPILE_FLAGS "-D_LIB -D_CRT_SECURE_NO_WARNINGS"
)
