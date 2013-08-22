set(wxAUILIB_NAME wxaui)

set(COMMON_CSOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/dummy.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/aui/auibar.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/aui/auibook.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/aui/dockart.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/aui/floatpane.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/aui/framemanager.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/aui/tabart.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/aui/tabmdi.cpp    
    )
source_group("Common Sources" FILES ${COMMON_CSOURCES})

set( MSW_HEADERS
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/genrcdefs.h
    )
source_group("MSW Headers" FILES ${MSW_HEADERS})

set( MSW_CSOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/version.rc
    )
source_group("MSW Sources" FILES ${MSW_CSOURCES})

set(COMMON_HHEADERS
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/aui/aui.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/aui/auibar.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/aui/auibook.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/aui/dockart.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/aui/floatpane.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/aui/framemanager.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/aui/tabart.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/aui/tabmdi.h   
    )
source_group("Common Headers" FILES ${COMMON_HHEADERS})    

set(SETUP_HHEADERS
    #${CMAKE_CURRENT_SOURCE_DIR}/include/wx/univ/setup.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/setup.h
    )
source_group("Setup Headers" FILES ${SETUP_HHEADERS}) 

set(PROJECT_HHEADERS ${COMMON_HHEADERS} ${SETUP_HHEADERS})
set(PROJECT_CSOURCES ${COMMON_CSOURCES} ${MSW_CSOURCES})

add_wxlib("${wxAUILIB_NAME}" "${PROJECT_CSOURCES}" "${PROJECT_HHEADERS}" "msw" "_aui" "aui")

set_target_properties(${wxAUILIB_NAME}
	PROPERTIES 
    COMPILE_FLAGS "-DDLL_EXPORTS -DWXUSINGDLL -DWXMAKINGDLL_AUI"
)

target_link_libraries(${wxAUILIB_NAME} ${wxBASELIB_NAME} ${wxCORELIB_NAME} ${wxADVLIB_NAME})

install(TARGETS 
    ${wxAUILIB_NAME}
    RUNTIME DESTINATION bin
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib)
	
install(FILES ${PROJECT_HHEADERS} DESTINATION include)