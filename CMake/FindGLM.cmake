# - Try to find GLM
# Once done, this will define
#
#  GLM_FOUND - system has GLM
#  GLM_INCLUDE_DIR - the GLM include directory

find_path(GLM_INCLUDE_DIR
	NAMES glm/glm.hpp
	HINTS
	NO_DEFAULT_PATH
	NO_CMAKE_ENVIRONMENT_PATH
	NO_CMAKE_SYSTEM_PATH
	NO_SYSTEM_ENVIRONMENT_PATH
	NO_CMAKE_PATH
	PATH_SUFFIXES include
	PATHS ${CERBER_GAME_ENGINE_DEPS_DIR}
)

# handle the QUIETLY and REQUIRED arguments and set XXX_FOUND to TRUE if all listed variables are TRUE
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(GLM DEFAULT_MSG GLM_INCLUDE_DIR)