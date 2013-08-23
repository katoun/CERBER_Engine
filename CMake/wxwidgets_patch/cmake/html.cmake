set(wxHTMLLIB_NAME wxhtml)

set(COMMON_CSOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/dummy.cpp
    )
source_group("Common Sources" FILES ${COMMON_CSOURCES})

set( MSW_CSOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/helpbest.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/version.rc
    )
source_group("MSW Sources" FILES ${MSW_CSOURCES})

set(GEN_CSOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/src/generic/htmllbox.cpp
    )
source_group("Generic Sources" FILES ${GEN_CSOURCES})

set(HTML_CSOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/src/html/helpctrl.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/html/helpdata.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/html/helpdlg.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/html/helpfrm.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/html/helpwnd.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/html/htmlcell.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/html/htmlfilt.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/html/htmlpars.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/html/htmltag.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/html/htmlwin.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/html/htmprint.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/html/m_dflist.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/html/m_fonts.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/html/m_hline.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/html/m_image.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/html/m_layout.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/html/m_links.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/html/m_list.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/html/m_pre.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/html/m_span.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/html/m_style.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/html/m_tables.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/html/styleparams.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/html/winpars.cpp
    )
source_group("HTML Sources" FILES ${HTML_CSOURCES})

set(MSW_HHEADERS
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/helpbest.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/genrcdefs.h
    )    
source_group("MSW Headers" FILES ${MSW_HHEADERS})

set(HTML_HHEADERS
        ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/html/helpctrl.h
        ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/html/helpdata.h
        ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/html/helpdlg.h
        ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/html/helpfrm.h
        ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/html/helpwnd.h
        ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/html/htmlcell.h
        ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/html/htmldefs.h
        ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/html/htmlfilt.h
        ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/html/htmlpars.h
        ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/html/htmlproc.h
        ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/html/htmltag.h
        ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/html/htmlwin.h
        ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/html/htmprint.h
        ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/html/m_templ.h
        ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/html/styleparams.h
        ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/html/winpars.h
    )    
source_group("HTML Headers" FILES ${HTML_HHEADERS})   

set(COMMON_HHEADERS
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/htmllbox.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/wxhtml.h
    )
source_group("Common Headers" FILES ${COMMON_HHEADERS})    

set(SETUP_HHEADERS
    #${CMAKE_CURRENT_SOURCE_DIR}/include/wx/univ/setup.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/setup.h
    )
source_group("Setup Headers" FILES ${SETUP_HHEADERS}) 

set(PROJECT_HHEADERS ${MSW_HHEADERS} ${COMMON_HHEADERS} ${SETUP_HHEADERS} ${HTML_HHEADERS})
set(PROJECT_CSOURCES ${COMMON_CSOURCES} ${MSW_CSOURCES} ${HTML_CSOURCES} ${GEN_CSOURCES})

add_wxlib("${wxHTMLLIB_NAME}" "${PROJECT_CSOURCES}" "${PROJECT_HHEADERS}" "msw" "_html" "html")

set_target_properties(${wxHTMLLIB_NAME}
	PROPERTIES 
    COMPILE_FLAGS "-D_LIB -DCRT_SECURE_NO_DEPRECATE=1 -D_CRT_NON_CONFORMING_SWPRINTFS=1 -D_SCL_SECURE_NO_WARNINGS=1"
)

target_link_libraries(${wxHTMLLIB_NAME} ${wxBASELIB_NAME} ${wxCORELIB_NAME})

install(TARGETS 
    ${wxHTMLLIB_NAME}
    RUNTIME DESTINATION bin
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib)
	
install(FILES ${MSW_HHEADERS} DESTINATION include/wx/msw)
install(FILES ${COMMON_HHEADERS} DESTINATION include/wx)
install(FILES ${HTML_HHEADERS} DESTINATION include/wx/html)
install(FILES ${SETUP_HHEADERS} DESTINATION include/wx/msw)

