set(PROJECT_NAME regex)

set(REGEXLIB_NAME wxregex)

set(LIB_CSOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/src/regex/regcomp.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/regex/regexec.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/regex/regerror.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/regex/regfree.c
    )
source_group("Source Files" FILES ${LIB_CSOURCES})

set(LIB_HHEADERS
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/genrcdefs.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/setup.h
)
source_group("Header Files" FILES ${LIB_HHEADERS}) 


set( PROJECT_HHEADERS ${LIB_HHEADERS} )
set( PROJECT_CSOURCES ${LIB_CSOURCES} )

if(WIN32)
  # Postfix of DLLs:
  set(REGEXLIB_DEBUG_POSTFIX d)
else()
  # Postfix of so's:
  set(REGEXLIB_DEBUG_POSTFIX)
endif()

add_library(${REGEXLIB_NAME} STATIC ${PROJECT_CSOURCES} ${PROJECT_HHEADERS})

if(MSVC)
    if(CMAKE_CL_64)
        set_target_properties(${REGEXLIB_NAME} PROPERTIES STATIC_LIBRARY_FLAGS "/machine:x64")
    endif()
endif()

set_target_properties(${REGEXLIB_NAME}
	PROPERTIES OUTPUT_NAME "${REGEXLIB_NAME}"
    LINKER_LANGUAGE CXX
	DEBUG_POSTFIX "${REGEXLIB_DEBUG_POSTFIX}"
    PROJECT_LABEL ${PROJECT_NAME}
    COMPILE_FLAGS "-D_LIB -D_CRT_SECURE_NO_WARNINGS"
)

include(BuildUtils)

install_external_lib_debug_pdb(${REGEXLIB_NAME}${REGEXLIB_DEBUG_POSTFIX} ${WX_OUTPUT_PATH})