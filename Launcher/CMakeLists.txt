set(Launcher_SRCS
	src/Launcher.cpp
)

set(CMAKE_DEBUG_POSTFIX "_d")

# Specify build paths
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CERBERGameEngine_SOURCE_DIR}/bin")

add_executable(Launcher ${Launcher_SRCS})

find_package(GLM REQUIRED)
find_package(OpenGL REQUIRED)
find_package(ZLIB REQUIRED)
find_package(PNG REQUIRED)
find_package(OpenAL REQUIRED)
find_package(Ogg REQUIRED)
find_package(Vorbis REQUIRED)
find_package(VorbisFile REQUIRED)
find_package(Bullet REQUIRED)

# Set up common include directories
include_directories(
	${CERBERGameEngine_SOURCE_DIR}/Engine/include
	${GLM_INCLUDE_DIR}
	${OPENGL_INCLUDE_DIR}
	${OPENAL_INCLUDE_DIR}
	${OGG_INCLUDE_DIR}
	${VORBISFILE_INCLUDE_DIR}
	${PNG_INCLUDE_DIR}
	${BULLET_INCLUDE_DIR}
)
target_link_libraries(Launcher
	${OPENGL_LIBRARIES}
	${OPENAL_LIBRARY}
	${PNG_LIBRARIES}
	${OGG_LIBRARIES}
	${VORBIS_LIBRARIES}
	${VORBISFILE_LIBRARIES}
	${BULLET_LIBRARIES}
	${EXTRA_LIBS}
)
