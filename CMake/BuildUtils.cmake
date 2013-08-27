function(add_vcproj_specific_settings TARGETNAME)
	if (MSVC)
		# install debug pdb files
		install(FILES ${CMAKE_CURRENT_BINARY_DIR}/Debug/${TARGETNAME}_d.pdb
				DESTINATION ${CERBER_GAME_ENGINE_DIR}/bin
				CONFIGURATIONS Debug)

		# create vcproj userfile
		set(CERBER_ENGINE_WORK_DIR ${CERBER_GAME_ENGINE_DIR})
		
		configure_file(${CERBERGameEngine_SOURCE_DIR}/CMake/VisualStudioUserFile.vcproj.user.in
					${CMAKE_CURRENT_BINARY_DIR}/${TARGETNAME}.vcproj.user
					@ONLY)

		configure_file(${CERBERGameEngine_SOURCE_DIR}/CMake/VisualStudioUserFile.vcxproj.user.in
					${CMAKE_CURRENT_BINARY_DIR}/${TARGETNAME}.vcxproj.user
					@ONLY)

		add_custom_command(TARGET ${TARGETNAME} POST_BUILD
			COMMAND ${CMAKE_COMMAND} -DBUILD_TYPE=$(Configuration) -P ${CMAKE_BINARY_DIR}/${TARGETNAME}/cmake_install.cmake)
	endif()
endfunction()

function(install_external_lib_debug_pdb TARGETNAME TARGETPATH)
	if (MSVC)
		# install debug pdb file
		install(FILES ${TARGETPATH}/${TARGETNAME}.pdb
				DESTINATION ${CERBER_GAME_ENGINE_DEPS_DIR}/lib
				CONFIGURATIONS Debug)
	endif()
endfunction()