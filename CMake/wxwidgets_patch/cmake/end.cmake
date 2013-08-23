macro(add_wxlib LIB_MNAME LIB_MCSOURCES LIB_MHHEADERS LIB_MPREFIX LIB_MEL PROJECT_MNAME)
#${wxRELEASE_NUMBER}
    set(LIB_MOUTNAME wx${LIB_MPREFIX}${wxMAJOR_VERSION}${wxMINOR_VERSION}u)
   
    if(WIN32)
		if(WX_SHARED)
		  # Postfix of DLLs:
		  set(LIB_DEBUG_POSTFIX d${LIB_MEL}_vc_custom)
		  set(LIB_RELEASE_POSTFIX ${LIB_MEL}_vc_custom)
		else(WX_SHARED)
			# Postfix of libs:
		  set(LIB_DEBUG_POSTFIX d${LIB_MEL})
		  set(LIB_RELEASE_POSTFIX ${LIB_MEL})
		endif(WX_SHARED)
    else(WIN32)
      # Postfix of so's:
      set(LIB_DEBUG_POSTFIX)
      set(LIB_RELEASE_POSTFIX)
    endif(WIN32)

    if(WX_SHARED)
      add_library(${LIB_MNAME} SHARED ${LIB_MCSOURCES} ${LIB_MHHEADERS})
      # if(MSVC)
        # # msvc does not append 'lib' - do it here to have consistent name    
        # set_target_properties(${LIB_NAME} PROPERTIES IMPORT_PREFIX "lib")
      # endif()
    elseif(WX_STATIC)
        # does not work without changing name
        add_library(${LIB_MNAME} STATIC ${LIB_MCSOURCES} ${LIB_MHHEADERS})
        if(MSVC)
            if(CMAKE_CL_64)
                set_target_properties(${LIB_MNAME} PROPERTIES STATIC_LIBRARY_FLAGS "/machine:x64")
            endif()
        endif()
    endif()  

    set_target_properties(${LIB_MNAME}
        PROPERTIES OUTPUT_NAME "${LIB_MOUTNAME}"
        DEBUG_POSTFIX "${LIB_DEBUG_POSTFIX}"
        RELEASE_POSTFIX "${LIB_RELEASE_POSTFIX}"
    #    FOLDER ${PROJECT_NAME}
        PROJECT_LABEL ${PROJECT_MNAME}
    )
    
    message(STATUS "lib out name=${LIB_MOUTNAME}${LIB_RELEASE_POSTFIX}")
endmacro()