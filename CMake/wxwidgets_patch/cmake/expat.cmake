set(PROJECT_NAME expat)

set(EXPATLIB_NAME wxexpat)

set(LIB_CSOURCES
	${CMAKE_CURRENT_SOURCE_DIR}/src/expat/lib/xmlparse.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/expat/lib/xmlrole.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/expat/lib/xmltok.c
    )
source_group("Source Files" FILES ${LIB_CSOURCES})

set( PROJECT_CSOURCES ${LIB_CSOURCES} )

if(WIN32)
  # Postfix of DLLs:
  set(EXPATLIB_DEBUG_POSTFIX d)
else()
  # Postfix of so's:
  set(EXPATLIB_DEBUG_POSTFIX)
endif()

add_library(${EXPATLIB_NAME} STATIC ${PROJECT_CSOURCES})

if(MSVC)
    if(CMAKE_CL_64)
        set_target_properties(${EXPATLIB_NAME} PROPERTIES STATIC_LIBRARY_FLAGS "/machine:x64")
    endif()
endif()

set_target_properties(${EXPATLIB_NAME}
	PROPERTIES OUTPUT_NAME "${EXPATLIB_NAME}"
    LINKER_LANGUAGE CXX
	DEBUG_POSTFIX "${EXPATLIB_DEBUG_POSTFIX}"
    PROJECT_LABEL ${PROJECT_NAME}
    COMPILE_FLAGS "-D_LIB -D_CRT_SECURE_NO_WARNINGS -DCOMPILED_FROM_DSP"
)
