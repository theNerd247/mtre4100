cmake_minimum_required(VERSION 3.0)
cmake_policy(SET CMP0011 NEW)

project("MTRE4100")

# only set this if it's the very toplevel project where your module directory is
# located (in this case it's cmake)
set(ARCB_MODULE_PATH
	"${PROJECT_SOURCE_DIR}/cmake/arcb/cmake"
	CACHE INTERNAL "the cmake module path to arcb")

set(MODULARTEX_MODULE_PATH
	"${PROJECT_SOURCE_DIR}/cmake/modulartex/cmake"
	CACHE INTERNAL "the cmake module path to modulartex"
	)

set(CMAKE_MODULE_PATH 
	${CMAKE_MODULE_PATH}
	${ARCB_MODULE_PATH}
	${MODULARTEX_MODULE_PATH}
	"${PROJECT_SOURCE_DIR}/cmake"
	)

include(ARCB)

find_package(Octave 4.0.0 REQUIRED
	COMPONENTS control
	)

# should be "toplevel","executable","staticlib",or "sharedlib"
set(buildType "toplevel")

# the source files located in the src/ directory
set(sources "")

#the name of the projects this project depends on
set(subProjects "Octave")

# the internal subprojecs. NOTE: include these subprojects in the order that
# they depend on each other. For example, if proj1 depends on proj2 list proj2
# BEFORE proj1
set(internalSubDirs "lab1")

# DO NOT REMOVE OR MODIFY
BuildProject(
	"${buildType}"
	"${sources}"
	"${subProjects}"
	"${internalSubDirs}"
	)
