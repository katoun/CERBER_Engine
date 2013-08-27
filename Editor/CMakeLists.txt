set(EDITORAPP_NAME Editor)

set(Editor_FILES
	include/Resource.h
	include/MainFrame.h
	include/Editor.h
	src/MainFrame.cpp
	src/Editor.cpp
)

set(CMAKE_CXX_FLAGS_COVERAGE "${CMAKE_CXX_FLAGS_RELEASE} -fprofile-arcs -ftest-coverage")

if(WIN32)
	add_executable(${EDITORAPP_NAME} WIN32 ${Editor_FILES})
else()
	add_executable(${EDITORAPP_NAME} ${Editor_FILES})
endif()

set_target_properties(${EDITORAPP_NAME} PROPERTIES DEBUG_POSTFIX "_d")

set_target_properties(${EDITORAPP_NAME}
	PROPERTIES 
    COMPILE_FLAGS "-DCRT_SECURE_NO_DEPRECATE=1 -D_SCL_SECURE_NO_WARNINGS=1 -D_CRT_SECURE_NO_WARNINGS=1"
)

find_package(CERBEREngine REQUIRED)
find_package(Assimp REQUIRED)
find_package(Freetype REQUIRED)
find_package(wxWidgets REQUIRED)

# Set up common include directories
include_directories(
	${CERBERGameEngine_SOURCE_DIR}/Editor/include
	${CERBER_ENGINE_INCLUDE_DIR}
	${FREETYPE_INCLUDE_DIRS}
	${ASSIMP_INCLUDE_DIR}
	${wxWidgets_INCLUDE_DIRS}
)
target_link_libraries(${EDITORAPP_NAME}
	${CERBER_ENGINE_LIBRARIES}
	${FREETYPE_LIBRARIES}
	${ASSIMP_LIBRARY}
	${wxWidgets_LIBRARIES}
	${EXTRA_LIBS}
)

install(TARGETS 
    ${EDITORAPP_NAME}
    RUNTIME DESTINATION bin
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib)
	
include(BuildUtils)

add_vcproj_specific_settings(${EDITORAPP_NAME})
