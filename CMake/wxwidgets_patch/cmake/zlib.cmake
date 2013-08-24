set(PROJECT_NAME zlib)

set(ZLIB_NAME wxzlib)

set(LIB_CSOURCES
	${CMAKE_CURRENT_SOURCE_DIR}/src/zlib/adler32.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/zlib/compress.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/zlib/crc32.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/zlib/deflate.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/zlib/gzio.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/zlib/infback.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/zlib/inffast.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/zlib/inflate.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/zlib/inftrees.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/zlib/trees.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/zlib/uncompr.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/zlib/zutil.c
    )
source_group("Source Files" FILES ${LIB_CSOURCES})

set( PROJECT_CSOURCES ${LIB_CSOURCES} )

if(WIN32)
  # Postfix of DLLs:
  set(ZLIB_DEBUG_POSTFIX d)
else()
  # Postfix of so's:
  set(ZLIB_DEBUG_POSTFIX)
endif()

add_library(${ZLIB_NAME} STATIC ${PROJECT_CSOURCES})

if(MSVC)
    if(CMAKE_CL_64)
        set_target_properties(${ZLIB_NAME} PROPERTIES STATIC_LIBRARY_FLAGS "/machine:x64")
    endif()
endif()

set_target_properties(${ZLIB_NAME}
	PROPERTIES OUTPUT_NAME "${ZLIB_NAME}"
    LINKER_LANGUAGE CXX
	DEBUG_POSTFIX "${ZLIB_DEBUG_POSTFIX}"
    PROJECT_LABEL ${PROJECT_NAME}
    COMPILE_FLAGS "-D_LIB -D_CRT_SECURE_NO_WARNINGS"
)

install(TARGETS 
    ${ZLIB_NAME}
    RUNTIME DESTINATION bin
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib)