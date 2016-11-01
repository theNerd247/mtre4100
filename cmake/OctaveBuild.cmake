cmake_minimum_required(VERSION 2.6)
cmake_policy(SET CMP0011 NEW) #acknowledge policy push/pop

# a custom command to run an octave script to generate some files.
function(genOctaveCommand
		scriptFilePath
		dataFiles
		)

	get_filename_component(scriptNameRaw ${scriptFilePath} NAME)
	get_filename_component(scriptDirRaw ${scriptFilePath} ABSOLUTE)
	get_filename_component(scriptDir ${scriptDirRaw} DIRECTORY)

	add_custom_command(OUTPUT ${dataFiles}
		COMMAND
		${Octave_EXECUTABLE} ${scriptDirRaw}
		COMMENT "run octave script ${scriptFilePath}"
		WORKING_DIRECTORY "${scriptDir}"
		)

	set_source_files_properties(${dataFiles} PROPERTIES GENERATED TRUE)

endfunction()
