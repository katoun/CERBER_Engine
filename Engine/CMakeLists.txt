set(Engine_HDRS
	include/Config.h
	include/Version.h
	include/Globals.h
	include/Engine.h
	include/core/Aabox3d.h
	include/core/Plane3d.h
	include/core/Sphere3d.h
	include/core/Math.h
	include/core/Utils.h
)

set(Engine_SRCS
	src/Engine.cpp
	src/core/Aabox3d.cpp
	src/core/Plane3d.cpp
	src/core/Sphere3d.cpp
	src/core/Math.cpp
	src/core/Utils.cpp
)

set(CMAKE_DEBUG_POSTFIX "_d")

add_library(Engine SHARED ${Engine_SRCS} ${Engine_HDRS})

add_definitions(-DENGINE_DLL)

find_package(GLM REQUIRED)
find_package(OpenGL REQUIRED)
find_package(GLEW REQUIRED)
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
	${GLEW_INCLUDE_DIR}
	${OPENAL_INCLUDE_DIR}
	${OGG_INCLUDE_DIR}
	${VORBISFILE_INCLUDE_DIR}
	${PNG_INCLUDE_DIR}
	${BULLET_INCLUDE_DIR}
)
target_link_libraries(Engine
	${OPENGL_LIBRARIES}
	${GLEW_LIBRARIES}
	${OPENAL_LIBRARY}
	${PNG_LIBRARIES}
	${OGG_LIBRARIES}
	${VORBIS_LIBRARIES}
	${VORBISFILE_LIBRARIES}
	${BULLET_LIBRARIES}
	${EXTRA_LIBS}
)

install(TARGETS 
    Engine
    RUNTIME DESTINATION bin
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib)
