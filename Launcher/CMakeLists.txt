set(Launcher_SRCS
	src/Launcher.cpp
)

set(CMAKE_DEBUG_POSTFIX "_d")

# Specify build paths
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CERBERGameEngine_SOURCE_DIR}/bin")

add_executable(Launcher ${Launcher_SRCS})


find_package(OpenGL REQUIRED)
find_package(GLFW REQUIRED)


# Set up common include directories
include_directories(
	${CERBERGameEngine_SOURCE_DIR}/Engine/include
	${OPENGL_INCLUDE_DIR}
	${GLFW_INCLUDE_DIR}
)
target_link_libraries(Launcher
	${OPENGL_LIBRARIES}
	${GLFW_LIBRARIES}
	${EXTRA_LIBS}
)
