set(wxNETLIB_NAME wxnet)

set(COMMON_CSOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/dummy.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/fs_inet.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/ftp.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/http.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/protocol.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/sckaddr.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/sckfile.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/sckipc.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/sckstrm.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/socket.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/url.cpp
    )
source_group("Common Sources" FILES ${COMMON_CSOURCES})

set( MSW_CSOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/sockmsw.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/urlmsw.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/version.rc
    )
source_group("MSW Sources" FILES ${MSW_CSOURCES})

set(MSW_HHEADERS
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/private/sockmsw.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/genrcdefs.h
    )    
source_group("MSW Headers" FILES ${MSW_HHEADERS})

set(COMMON_HHEADERS
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/protocol/file.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/fs_inet.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/protocol/ftp.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/protocol/http.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/protocol/log.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/protocol/protocol.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/sckaddr.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/sckipc.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/sckstrm.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/socket.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/url.h
    )
source_group("Common Headers" FILES ${COMMON_HHEADERS})    

set(SETUP_HHEADERS
    #${CMAKE_CURRENT_SOURCE_DIR}/include/wx/univ/setup.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/setup.h
    )
source_group("Setup Headers" FILES ${SETUP_HHEADERS}) 


set(PROJECT_HHEADERS ${MSW_HHEADERS} ${COMMON_HHEADERS} ${SETUP_HHEADERS})
set(PROJECT_CSOURCES ${COMMON_CSOURCES} ${MSW_CSOURCES} )

add_wxlib("${wxNETLIB_NAME}" "${PROJECT_CSOURCES}" "${PROJECT_HHEADERS}" "base" "_net" "net")

set_target_properties(${wxNETLIB_NAME}
	PROPERTIES 
    COMPILE_FLAGS "-DDLL_EXPORTS -DWXUSINGDLL -DWXMAKINGDLL_NET -DwxUSE_BASE=0"
)

target_link_libraries(${wxNETLIB_NAME} ${wxBASELIB_NAME})

install(TARGETS 
    ${wxNETLIB_NAME}
    RUNTIME DESTINATION bin
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib)
	
install(FILES ${PROJECT_HHEADERS} DESTINATION include)
