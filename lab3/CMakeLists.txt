cmake_minimum_required(VERSION 2.6)
#acknowledge policy push/pop
cmake_policy(SET CMP0011 NEW) 

include(LaTeXBuild)
include(OctaveBuild)

project("lab3")

set(mainTexFile "main.tex")

set(texDir "tex")
set(styDir "sty")
set(imgDir "img")

set(subProjects "util")
#set(styleFiles "")

set(includeList 
	"data"
	"tex"
	"sty"
	"img"
	)

genOctaveCommand("scripts/analyze2.m" "img/pt2_80Hz.pdf" "img/pt2_200Hz.pdf")
genOctaveCommand("scripts/analyze3.m" "img/pt3.pdf")
genOctaveCommand("scripts/analyze4.m" "img/pt4_1.pdf" "img/pt4_2.pdf")

add_custom_target(octaveGenFiles3 DEPENDS 
  "img/pt2_80Hz.pdf" "img/pt2_200Hz.pdf"
  "img/pt3.pdf"
  "img/pt4_1.pdf" "img/pt4_2.pdf"
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

add_dependencies(LaTeX_${PROJECT_NAME} octaveGenFiles3)
