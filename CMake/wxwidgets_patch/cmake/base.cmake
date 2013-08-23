set(wxBASELIB_NAME wxbase)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src/zlib)

if(WIN32)
    configure_file(${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/setup.h ${WX_OUTPUT_PATH}/msw/wx/setup.h @ONLY)
endif()

set(COMMON_CSOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/any.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/appbase.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/arcall.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/arcfind.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/archive.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/arrstr.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/base64.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/clntdata.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/cmdline.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/config.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/convauto.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/datetime.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/datetimefmt.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/datstrm.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/dircmn.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/dummy.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/dynarray.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/dynlib.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/dynload.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/encconv.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/event.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/evtloopcmn.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/extended.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/ffile.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/file.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/fileback.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/fileconf.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/filefn.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/filename.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/filesys.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/filtall.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/filtfind.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/fmapbase.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/fs_arc.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/fs_filter.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/fs_mem.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/fswatchercmn.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/hash.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/hashmap.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/init.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/intl.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/ipcbase.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/languageinfo.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/list.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/log.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/longlong.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/memory.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/mimecmn.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/module.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/msgout.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/mstream.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/numformatter.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/object.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/platinfo.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/powercmn.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/process.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/regex.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/sstream.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/stdpbase.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/stdstream.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/stopwatch.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/strconv.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/stream.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/string.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/stringimpl.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/stringops.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/strvararg.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/sysopt.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/tarstrm.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/textbuf.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/textfile.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/time.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/timercmn.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/timerimpl.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/tokenzr.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/translation.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/txtstrm.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/unichar.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/uri.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/ustring.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/utilscmn.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/variant.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/wfstream.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/wxcrt.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/wxprintf.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/xlocale.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/xti.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/xtistrm.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/zipstrm.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/common/zstream.cpp
)

source_group("Common Sources" FILES ${COMMON_CSOURCES})

set( MSW_CSOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/basemsw.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/crashrpt.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/dde.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/debughlp.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/dir.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/dlmsw.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/evtloop.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/fswatcher.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/main.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/mimetype.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/mslu.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/power.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/regconf.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/registry.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/snglinst.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/stackwalk.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/stdpaths.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/thread.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/timer.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/utils.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/utilsexc.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/volume.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/msw/version.rc
)
source_group("MSW Sources" FILES ${MSW_CSOURCES})

set(GEN_CSOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/src/generic/fswatcherg.cpp
    )
source_group("Generic Sources" FILES ${GEN_CSOURCES})

set(MSW_HHEADERS
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/apptbase.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/apptrait.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/chkconf.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/crashrpt.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/dde.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/debughlp.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/fswatcher.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/gccpriv.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/genrcdefs.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/libraries.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/mimetype.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/mslu.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/private.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/regconf.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/registry.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/seh.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/stackwalk.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/stdpaths.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/winundef.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/wrapcctl.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/wrapcdlg.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/wrapwin.h  
    )    
source_group("MSW Headers" FILES ${MSW_HHEADERS})

set(GEN_HHEADERS
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/generic/fswatcher.h
    )    
source_group("Generic Headers" FILES ${GEN_HHEADERS})    

set(WXH_HHEADERS
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/html/forcelnk.h
    )    
source_group("wxHTML Headers" FILES ${WXH_HHEADERS})  

set(COMMON_MAIN_HHEADERS
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/afterstd.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/any.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/anystr.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/app.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/apptrait.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/archive.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/arrstr.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/atomic.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/base64.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/beforestd.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/buffer.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/build.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/chartype.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/checkeddelete.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/chkconf.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/clntdata.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/cmdargs.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/cmdline.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/confbase.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/config.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/containr.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/convauto.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/cpp.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/crt.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/datetime.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/datstrm.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/dde.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/debug.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/defs.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/dir.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/dlimpexp.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/dlist.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/dynarray.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/dynlib.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/dynload.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/encconv.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/event.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/eventfilter.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/evtloop.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/except.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/features.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/ffile.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/file.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/fileconf.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/filefn.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/filename.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/filesys.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/flags.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/fontenc.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/fontmap.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/fs_arc.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/fs_filter.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/fs_mem.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/fs_zip.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/fswatcher.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/hash.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/hashmap.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/hashset.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/iconloc.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/init.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/intl.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/iosfwrap.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/ioswrap.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/ipc.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/ipcbase.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/kbdstate.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/language.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/link.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/list.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/log.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/longlong.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/math.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/memconf.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/memory.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/memtext.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/mimetype.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/module.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/mousestate.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msgout.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msgqueue.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/mstream.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/numformatter.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/object.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/platform.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/platinfo.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/power.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/process.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/ptr_scpd.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/ptr_shrd.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/recguard.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/regex.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/rtti.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/scopedarray.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/scopedptr.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/scopeguard.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/sharedptr.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/snglinst.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/sstream.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/stack.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/stackwalk.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/stdpaths.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/stdstream.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/stockitem.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/stopwatch.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/strconv.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/stream.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/string.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/stringimpl.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/stringops.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/strvararg.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/sysopt.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/tarstrm.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/textbuf.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/textfile.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/thread.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/time.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/timer.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/tls.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/tokenzr.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/tracker.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/translation.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/txtstrm.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/typeinfo.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/types.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/unichar.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/uri.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/ustring.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/utils.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/variant.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/vector.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/version.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/versioninfo.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/volume.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/weakref.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/wfstream.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/wx.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/wxchar.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/wxcrt.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/wxcrtbase.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/wxcrtvararg.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/wxprec.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/xlocale.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/xti.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/xti2.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/xtictor.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/xtihandler.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/xtiprop.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/xtistrm.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/xtitypes.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/zipstrm.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/zstream.h
)

set(COMMON_META_HHEADERS	
	${CMAKE_CURRENT_SOURCE_DIR}/include/wx/meta/convertible.h
	${CMAKE_CURRENT_SOURCE_DIR}/include/wx/meta/if.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/meta/implicitconversion.h
	${CMAKE_CURRENT_SOURCE_DIR}/include/wx/meta/int2type.h
	${CMAKE_CURRENT_SOURCE_DIR}/include/wx/meta/movable.h
	${CMAKE_CURRENT_SOURCE_DIR}/include/wx/meta/pod.h
)
set(COMMON_HHEADERS ${COMMON_MAIN_HHEADERS} ${COMMON_META_HHEADERS}) 
source_group("Common Headers" FILES ${COMMON_HHEADERS})    

set(SETUP_HHEADERS
    #${CMAKE_CURRENT_SOURCE_DIR}/include/wx/univ/setup.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/wx/msw/setup.h
)
source_group("Setup Headers" FILES ${SETUP_HHEADERS}) 

set(PROJECT_HHEADERS ${MSW_HHEADERS} ${GEN_HHEADERS} ${WXH_HHEADERS} ${COMMON_HHEADERS} ${SETUP_HHEADERS})
set(PROJECT_CSOURCES ${COMMON_CSOURCES} ${MSW_CSOURCES} ${GEN_CSOURCES})

add_wxlib("${wxBASELIB_NAME}" "${PROJECT_CSOURCES}" "${PROJECT_HHEADERS}" "base" "" "base")

set_target_properties(${wxBASELIB_NAME}
	PROPERTIES 
    COMPILE_FLAGS "-D_LIB -DwxUSE_GUI=0 -DwxUSE_BASE=1 -DCRT_SECURE_NO_DEPRECATE=1 -D_CRT_NON_CONFORMING_SWPRINTFS=1 -D_SCL_SECURE_NO_WARNINGS=1"
)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src/regex)
target_link_libraries(${wxBASELIB_NAME} ${REGEXLIB_NAME} ${ZLIB_NAME} winmm.lib comctl32.lib rpcrt4.lib wsock32.lib wininet.lib)

install(TARGETS 
    ${wxBASELIB_NAME}
    RUNTIME DESTINATION bin
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib)
	
install(FILES ${MSW_HHEADERS} DESTINATION include/wx/msw)
install(FILES ${GEN_HHEADERS} DESTINATION include/wx/generic)
install(FILES ${WXH_HHEADERS} DESTINATION include/wx/html)
install(FILES ${COMMON_MAIN_HHEADERS} DESTINATION include/wx)
install(FILES ${COMMON_META_HHEADERS} DESTINATION include/wx/meta)
install(FILES ${SETUP_HHEADERS} DESTINATION include/wx/msw)