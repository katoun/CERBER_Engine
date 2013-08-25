set(Launcher_SRCS
	src/Launcher.cpp
)

add_executable(Launcher ${Launcher_SRCS})
set_target_properties(Launcher PROPERTIES DEBUG_POSTFIX "_d")

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

install(TARGETS 
    Launcher
    RUNTIME DESTINATION bin
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib)
