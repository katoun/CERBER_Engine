set(Editor_HDRS
	include/Resource.h
	include/MainFrame.h
	include/Editor.h
)

set(Editor_SRCS
	src/MainFrame.cpp
	src/Editor.cpp
)

set(CMAKE_CXX_FLAGS_COVERAGE "${CMAKE_CXX_FLAGS_RELEASE} -fprofile-arcs -ftest-coverage")

if(WIN32)
	add_executable(Editor WIN32 ${Editor_SRCS} ${Editor_HDRS})
else()
	add_executable(Editor ${Editor_SRCS} ${Editor_HDRS})
endif()

set_target_properties(Editor PROPERTIES DEBUG_POSTFIX "_d")

set_target_properties(Editor
	PROPERTIES 
    COMPILE_FLAGS "-DCRT_SECURE_NO_DEPRECATE=1 -D_SCL_SECURE_NO_WARNINGS=1 -D_CRT_SECURE_NO_WARNINGS=1"
)

find_package(Assimp REQUIRED)
find_package(Freetype REQUIRED)
find_package(wxWidgets REQUIRED)

# Set up common include directories
include_directories(
	${CERBERGameEngine_SOURCE_DIR}/Engine/include
	${CERBERGameEngine_SOURCE_DIR}/Editor/include
	${FREETYPE_INCLUDE_DIRS}
	${ASSIMP_INCLUDE_DIR}
	${wxWidgets_INCLUDE_DIRS}
)
target_link_libraries(Editor
	${FREETYPE_LIBRARIES}
	${ASSIMP_LIBRARY}
	${wxWidgets_LIBRARIES}
	${EXTRA_LIBS}
)

install(TARGETS 
    Editor
    RUNTIME DESTINATION bin
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib)
