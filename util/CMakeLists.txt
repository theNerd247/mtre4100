cmake_minimum_required(VERSION 2.6)
#acknowledge policy push/pop
cmake_policy(SET CMP0011 NEW)

include(LaTeXBuild)

project("util")

set(mainTexFile "")

#set(subProjects "")

set(styleFiles
	"sty/labformat.sty"
	"sty/mtre4100.sty"
	"sty/notation.sty"
	)

set(includeList
	"tex"
	"sty"
	"img"
	)

SetupLaTexBuildEnv (
	# the main tex file
	"${mainTexFile}"
	# the file search paths this project provides
	"${includeList}"
	# the style files this project provides
	"${styleFiles}"
	# projects this project depends on
	"${subProjects}"
	)
