set(LAUNCHERAPP_NAME Launcher)

set(Launcher_FILES
	src/Launcher.cpp
)

add_executable(${LAUNCHERAPP_NAME} ${Launcher_FILES})
set_target_properties(${LAUNCHERAPP_NAME} PROPERTIES DEBUG_POSTFIX "_d")

find_package(CERBEREngine REQUIRED)
find_package(OpenGL REQUIRED)
find_package(GLFW REQUIRED)

# Set up common include directories
include_directories(
	${CERBER_ENGINE_INCLUDE_DIR}
	${OPENGL_INCLUDE_DIR}
	${GLFW_INCLUDE_DIR}
)
target_link_libraries(${LAUNCHERAPP_NAME}
	${CERBER_ENGINE_LIBRARIES}
	${OPENGL_LIBRARIES}
	${GLFW_LIBRARIES}
	${EXTRA_LIBS}
)

install(TARGETS
    ${LAUNCHERAPP_NAME}
    RUNTIME DESTINATION bin
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib)
	
include(BuildUtils)

add_vcproj_specific_settings(${LAUNCHERAPP_NAME})
