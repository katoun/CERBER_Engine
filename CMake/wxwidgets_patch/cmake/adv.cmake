set(wxADVLIB_NAME wxadv)

set(COMMON_CSOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/animatecmn.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/bmpcboxcmn.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/calctrlcmn.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/datavcmn.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/dummy.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/gridcmn.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/hyperlnkcmn.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/odcombocmn.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/richtooltipcmn.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/taskbarcmn.cpp
    )
source_group("Common Sources" FILES ${COMMON_CSOURCES})

set( MSW_CSOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/aboutdlg.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/bmpcbox.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/calctrl.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/commandlinkbutton.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/datecontrols.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/datectrl.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/datetimectrl.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/hyperlink.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/joystick.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/notifmsg.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/richtooltip.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/sound.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/taskbar.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/timectrl.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/version.rc
    )
source_group("MSW Sources" FILES ${MSW_CSOURCES})

set(GEN_CSOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/src/generic/aboutdlgg.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/generic/animateg.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/generic/bannerwindow.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/generic/bmpcboxg.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/generic/calctrlg.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/generic/commandlinkbuttong.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/generic/datavgen.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/generic/datectlg.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/generic/editlbox.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/generic/grid.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/generic/gridctrl.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/generic/grideditors.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/generic/gridsel.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/generic/helpext.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/generic/hyperlinkg.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/generic/laywin.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/generic/notifmsgg.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/generic/odcombo.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/generic/propdlg.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/generic/richtooltipg.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/generic/sashwin.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/generic/splash.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/generic/timectrlg.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/generic/tipdlg.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/generic/treelist.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/generic/wizard.cpp
    )
source_group("Generic Sources" FILES ${GEN_CSOURCES})

set(MSW_HHEADERS
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/bmpcbox.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/calctrl.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/commandlinkbutton.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/datectrl.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/datetimectrl.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/genrcdefs.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/hyperlink.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/joystick.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/notifmsg.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/sound.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/taskbar.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/timectrl.h
    )    
source_group("MSW Headers" FILES ${MSW_HHEADERS})

set(GEN_HHEADERS
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/generic/aboutdlgg.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/generic/animate.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/generic/bmpcbox.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/generic/calctrlg.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/generic/dataview.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/generic/datectrl.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/generic/dvrenderer.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/generic/dvrenderers.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/generic/grid.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/generic/gridctrl.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/generic/grideditors.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/generic/gridsel.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/generic/helpext.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/generic/hyperlink.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/generic/laywin.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/generic/notifmsg.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/generic/propdlg.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/generic/sashwin.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/generic/splash.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/generic/timectrl.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/generic/wizard.h
    )    
source_group("Generic Headers" FILES ${GEN_HHEADERS})   

set(COMMON_HHEADERS
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/aboutdlg.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/animate.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/bannerwindow.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/bmpcbox.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/calctrl.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/commandlinkbutton.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/dataview.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/datectrl.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/dateevt.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/datetimectrl.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/dcbuffer.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/dvrenderers.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/editlbox.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/grid.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/hyperlink.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/joystick.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/laywin.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/notifmsg.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/odcombo.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/propdlg.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/richtooltip.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/sashwin.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/sound.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/splash.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/taskbar.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/timectrl.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/tipdlg.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/treelist.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/wizard.h
    )
source_group("Common Headers" FILES ${COMMON_HHEADERS})    

set(SETUP_HHEADERS
    #${CMAKE_CURRENT_SOURCE_DIR}/include/wx/univ/setup.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/setup.h
    )
source_group("Setup Headers" FILES ${SETUP_HHEADERS}) 

set(PROJECT_HHEADERS ${MSW_HHEADERS} ${COMMON_HHEADERS} ${SETUP_HHEADERS} ${GEN_HHEADERS})
set(PROJECT_CSOURCES ${COMMON_CSOURCES} ${MSW_CSOURCES} ${GEN_CSOURCES})

add_wxlib("${wxADVLIB_NAME}" "${PROJECT_CSOURCES}" "${PROJECT_HHEADERS}" "msw" "_adv" "adv")

set_target_properties(${wxADVLIB_NAME}
	PROPERTIES 
    COMPILE_FLAGS "-DDLL_EXPORTS -DWXUSINGDLL -DWXMAKINGDLL_ADV"
)

target_link_libraries(${wxADVLIB_NAME} ${wxBASELIB_NAME} ${wxCORELIB_NAME})

install(TARGETS 
    ${wxADVLIB_NAME}
    RUNTIME DESTINATION bin
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib)
	
install(FILES ${PROJECT_HHEADERS} DESTINATION include)