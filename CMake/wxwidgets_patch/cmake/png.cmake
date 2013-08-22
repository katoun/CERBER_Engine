set(PROJECT_NAME png)

set(PNGLIB_NAME wxpng)

set(LIB_CSOURCES
	${CMAKE_CURRENT_SOURCE_DIR}/src/png/png.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/png/pngerror.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/png/pngget.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/png/pngmem.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/png/pngpread.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/png/pngread.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/png/pngrio.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/png/pngrtran.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/png/pngrutil.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/png/pngset.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/png/pngtrans.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/png/pngwio.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/png/pngwrite.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/png/pngwtran.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/png/pngwutil.c
    )
source_group("Source Files" FILES ${LIB_CSOURCES})

set( PROJECT_CSOURCES ${LIB_CSOURCES} )

if(WIN32)
  # Postfix of DLLs:
  set(PNGLIB_DEBUG_POSTFIX d)
else()
  # Postfix of so's:
  set(PNGLIB_DEBUG_POSTFIX)
endif()

add_library(${PNGLIB_NAME} STATIC ${PROJECT_CSOURCES})

if(MSVC)
    if(CMAKE_CL_64)
        set_target_properties(${PNGLIB_NAME} PROPERTIES STATIC_LIBRARY_FLAGS "/machine:x64")
    endif()
endif()

set_target_properties(${PNGLIB_NAME}
	PROPERTIES OUTPUT_NAME "${PNGLIB_NAME}"
    LINKER_LANGUAGE CXX
	DEBUG_POSTFIX "${PNGLIB_DEBUG_POSTFIX}"
    PROJECT_LABEL ${PROJECT_NAME}
    COMPILE_FLAGS "-D_LIB -D_CRT_SECURE_NO_WARNINGS"
)
