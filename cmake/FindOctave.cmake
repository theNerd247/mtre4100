#finds octave and any subpackages required
include(FindPackageHandleStandardArgs)

# this sets: 
# Octave_FOUND
# Octave_EXECUTABLE

find_program(Octave_binary "octave")

if(EXISTS ${Octave_binary})
	find_program(Octave_config_exe "octave-config")

	if(EXISTS ${Octave_config_exe})
		execute_process(COMMAND ${Octave_config_exe} "-v"
			OUTPUT_VARIABLE Octave_VERSION_STRING
			OUTPUT_STRIP_TRAILING_WHITESPACE)
	endif(EXISTS ${Octave_config_exe})
endif(EXISTS ${Octave_binary})

#find the components
foreach(c ${Octave_FIND_COMPONENTS})

	execute_process(COMMAND ${Octave_binary} --eval "pkg list ${c}"
		OUTPUT_VARIABLE "Octave_${c}_out"
		)

	if(NOT "${Octave_${c}_out}" MATCHES "package ${c} is not installed.")
		set("Octave_${c}_FOUND" TRUE)
	endif()
endforeach(c ${Octave_FIND_COMPONENTS})

find_package_handle_standard_args(Octave
	REQUIRED_VARS Octave_binary
	HANDLE_COMPONENTS
	VERSION_VAR Octave_VERSION_STRING
	)

if(Octave_FOUND)
	set(Octave_EXECUTABLE "${Octave_binary}")
endif()
