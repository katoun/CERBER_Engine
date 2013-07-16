set(Engine_HDRS
	include/Config.h
	include/Globals.h
	include/Engine.h
)

set(Engine_SRCS
	src/Engine.cpp
)

set(CMAKE_DEBUG_POSTFIX "_d")

add_library(Engine SHARED ${Engine_SRCS} ${Engine_HDRS})

add_definitions(-DENGINE_DLL)

find_package(OpenGL REQUIRED)
find_package(ZLIB REQUIRED)
find_package(PNG REQUIRED)
find_package(OpenAL REQUIRED)
find_package(Ogg REQUIRED)
find_package(Vorbis REQUIRED)
find_package(VorbisFile REQUIRED)

# Set up common include directories
include_directories(
	${CERBERGameEngine_SOURCE_DIR}/Engine/include
	${OPENGL_INCLUDE_DIR}
	${OPENAL_INCLUDE_DIR}
	${OGG_INCLUDE_DIR}
	${VORBISFILE_INCLUDE_DIR}
	${PNG_INCLUDE_DIR}
)
target_link_libraries(Engine
	${OPENGL_LIBRARIES}
	${OPENAL_LIBRARY}
	${PNG_LIBRARIES}
	${OGG_LIBRARIES}
	${VORBIS_LIBRARIES}
	${VORBISFILE_LIBRARIES}
	${EXTRA_LIBS}
)
