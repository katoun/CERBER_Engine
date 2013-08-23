set(Editor_SRCS
	src/Editor.cpp
)

set(CMAKE_CXX_FLAGS_COVERAGE "${CMAKE_CXX_FLAGS_RELEASE} -fprofile-arcs -ftest-coverage")

set(CMAKE_DEBUG_POSTFIX "_d")

# Specify build paths
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CERBERGameEngine_SOURCE_DIR}/bin")

#set(CMAKE_INSTALL_PREFIX ${CERBER_GAME_ENGINE_DEPS_DIR})
#if(MINGW)
#  set(WX_LIB_DIR_PREFIX gcc)
#else()
#  set(WX_LIB_DIR_PREFIX vc)
#endif()
#set(wxWidgets_ROOT_DIR ${CERBER_GAME_ENGINE_DEPS_DIR})
#set(wxWidgets_LIB_DIR ${CERBER_GAME_ENGINE_DEPS_DIR}/lib/${WX_LIB_DIR_PREFIX}_lib)
#set(wxWidgets_CONFIGURATION msw)

add_executable(Editor ${Editor_SRCS})

find_package(Assimp REQUIRED)
find_package(Freetype REQUIRED)
find_package(wxWidgets REQUIRED)
#find_package(GLM REQUIRED)
#find_package(OpenGL REQUIRED)
#find_package(GLEW REQUIRED)
#find_package(ZLIB REQUIRED)
#find_package(PNG REQUIRED)
#find_package(OpenAL REQUIRED)
#find_package(Ogg REQUIRED)
#find_package(Vorbis REQUIRED)
#find_package(VorbisFile REQUIRED)
#find_package(Bullet REQUIRED)

# Set up common include directories
include_directories(
	${CERBERGameEngine_SOURCE_DIR}/Engine/include
	${FREETYPE_INCLUDE_DIRS}
	${ASSIMP_INCLUDE_DIR}
	${wxWidgets_INCLUDE_DIRS}
	#${GLM_INCLUDE_DIR}
	#${OPENGL_INCLUDE_DIR}
	#${GLEW_INCLUDE_DIR}
	#${GLFW_INCLUDE_DIR}
	#${OPENAL_INCLUDE_DIR}
	#${OGG_INCLUDE_DIR}
	#${VORBISFILE_INCLUDE_DIR}
	#${PNG_INCLUDE_DIR}
	#${BULLET_INCLUDE_DIR}
)
target_link_libraries(Editor
	${FREETYPE_LIBRARIES}
	${ASSIMP_LIBRARY}
	${wxWidgets_LIBRARIES}
	#${OPENGL_LIBRARIES}
	#${GLEW_LIBRARIES}
	#${GLFW_LIBRARIES}
	#${OPENAL_LIBRARY}
	#${PNG_LIBRARIES}
	#${OGG_LIBRARIES}
	#${VORBIS_LIBRARIES}
	#${VORBISFILE_LIBRARIES}
	#${BULLET_LIBRARIES}
	${EXTRA_LIBS}
	#TODO: fix this
	comctl32.lib
	rpcrt4.lib
	winmm.lib
	wsock32.lib
	#TODO: fix this
)
