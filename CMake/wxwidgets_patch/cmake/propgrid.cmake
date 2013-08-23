set(wxPROPGRIDLIB_NAME wxpropgrid)

set(COMMON_CSOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/dummy.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/propgrid/advprops.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/propgrid/editors.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/propgrid/manager.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/propgrid/property.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/propgrid/propgrid.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/propgrid/propgridiface.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/propgrid/propgridpagestate.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/propgrid/props.cpp
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

set(COMMON_HHEADERS
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/propgrid/advprops.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/propgrid/editors.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/propgrid/manager.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/propgrid/property.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/propgrid/propgrid.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/propgrid/propgriddefs.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/propgrid/propgridiface.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/propgrid/propgridpagestate.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/propgrid/props.h
    )
source_group("Common Headers" FILES ${COMMON_HHEADERS})    

set(SETUP_HHEADERS
    #${CMAKE_CURRENT_SOURCE_DIR}/include/wx/univ/setup.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/setup.h
    )
source_group("Setup Headers" FILES ${SETUP_HHEADERS}) 

set(PROJECT_HHEADERS ${MSW_HHEADERS} ${COMMON_HHEADERS} ${SETUP_HHEADERS})
set(PROJECT_CSOURCES ${COMMON_CSOURCES} ${MSW_CSOURCES} )

add_wxlib("${wxPROPGRIDLIB_NAME}" "${PROJECT_CSOURCES}" "${PROJECT_HHEADERS}" "msw" "_propgrid" "propgrid")

set_target_properties(${wxPROPGRIDLIB_NAME}
	PROPERTIES 
    COMPILE_FLAGS "-DDLL_EXPORTS -DWXUSINGDLL -DWXMAKINGDLL_PROPGRID"
)

target_link_libraries(${wxPROPGRIDLIB_NAME} ${wxBASELIB_NAME} ${wxCORELIB_NAME} ${wxADVLIB_NAME})

install(TARGETS 
    ${wxPROPGRIDLIB_NAME}
    RUNTIME DESTINATION bin
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib)
	
install(FILES ${MSW_HHEADERS} DESTINATION include/wx/msw)
install(FILES ${COMMON_HHEADERS} DESTINATION include/wx/propgrid)
install(FILES ${SETUP_HHEADERS} DESTINATION include/wx/msw)
