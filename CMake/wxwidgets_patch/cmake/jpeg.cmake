set(PROJECT_NAME jpeg)

set(JPEGLIB_NAME wxjpeg)

set(LIB_CSOURCES
	${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jcapimin.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jcapistd.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jccoefct.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jccolor.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jcdctmgr.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jchuff.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jcinit.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jcmainct.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jcmarker.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jcmaster.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jcomapi.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jcparam.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jcphuff.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jcprepct.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jcsample.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jctrans.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jdapimin.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jdapistd.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jdatadst.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jdatasrc.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jdcoefct.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jdcolor.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jddctmgr.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jdhuff.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jdinput.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jdmainct.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jdmarker.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jdmaster.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jdmerge.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jdphuff.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jdpostct.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jdsample.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jdtrans.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jerror.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jfdctflt.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jfdctfst.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jfdctint.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jidctflt.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jidctfst.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jidctint.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jidctred.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jmemmgr.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jmemnobs.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jquant1.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jquant2.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/jpeg/jutils.c
    )
source_group("Source Files" FILES ${LIB_CSOURCES})

set( PROJECT_CSOURCES ${LIB_CSOURCES} )

if(WIN32)
  # Postfix of DLLs:
  set(JPEGLIB_DEBUG_POSTFIX d)
else()
  # Postfix of so's:
  set(JPEGLIB_DEBUG_POSTFIX)
endif()

add_library(${JPEGLIB_NAME} STATIC ${PROJECT_CSOURCES})

if(MSVC)
    if(CMAKE_CL_64)
        set_target_properties(${JPEGLIB_NAME} PROPERTIES STATIC_LIBRARY_FLAGS "/machine:x64")
    endif()
endif()

set_target_properties(${JPEGLIB_NAME}
	PROPERTIES OUTPUT_NAME "${JPEGLIB_NAME}"
    LINKER_LANGUAGE CXX
	DEBUG_POSTFIX "${JPEGLIB_DEBUG_POSTFIX}"
    PROJECT_LABEL ${PROJECT_NAME}
    COMPILE_FLAGS "-D_LIB -D_CRT_SECURE_NO_WARNINGS"
)
