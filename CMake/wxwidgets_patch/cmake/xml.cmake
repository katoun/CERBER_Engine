set(wxXMLLIB_NAME wxxml)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src/expat/lib)

set(COMMON_CSOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/dummy.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/xtixml.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/xml/xml.cpp
    )
source_group("Common Sources" FILES ${COMMON_CSOURCES})

set( MSW_CSOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/version.rc
    )
source_group("MSW Sources" FILES ${MSW_CSOURCES})

set(MSW_HHEADERS
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/genrcdefs.h
    )    
source_group("MSW Headers" FILES ${MSW_HHEADERS})

set(COMMON_MAIN_HHEADERS
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/xtixml.h
)
set(COMMON_XML_HHEADERS
	${CMAKE_CURRENT_SOURCE_DIR}/include/wx/xml/xml.h
    )
set(COMMON_HHEADERS ${COMMON_MAIN_HHEADERS} ${COMMON_XML_HHEADERS})
source_group("Common Headers" FILES ${COMMON_HHEADERS})    

set(SETUP_HHEADERS
    #${CMAKE_CURRENT_SOURCE_DIR}/include/wx/univ/setup.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/setup.h
    )
source_group("Setup Headers" FILES ${SETUP_HHEADERS}) 


set(PROJECT_HHEADERS ${MSW_HHEADERS} ${COMMON_HHEADERS} ${SETUP_HHEADERS})
set(PROJECT_CSOURCES ${COMMON_CSOURCES} ${MSW_CSOURCES} )

add_wxlib("${wxXMLLIB_NAME}" "${PROJECT_CSOURCES}" "${PROJECT_HHEADERS}" "base" "_xml" "xml")

set_target_properties(${wxXMLLIB_NAME}
	PROPERTIES 
    COMPILE_FLAGS "-DDLL_EXPORTS -DWXUSINGDLL -DWXMAKINGDLL_XML -DwxUSE_BASE=0"
)

target_link_libraries(${wxXMLLIB_NAME} ${wxBASELIB_NAME} ${EXPATLIB_NAME})

install(TARGETS 
    ${wxXMLLIB_NAME}
    RUNTIME DESTINATION bin
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib)

install(FILES ${MSW_HHEADERS} DESTINATION include/wx/msw)
install(FILES ${COMMON_MAIN_HHEADERS} DESTINATION include/wx)
install(FILES ${COMMON_XML_HHEADERS} DESTINATION include/wx/xml)
install(FILES ${SETUP_HHEADERS} DESTINATION include/wx/msw)