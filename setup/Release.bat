@echo off
	cd ..\
	call makefile.bat

@echo off
	cd setup
	set IsccDir=.\iscc
	set Iscc=%IsccDir%\iscc.exe
	echo Start Make NoMark Store ...
	"%Iscc%" setup.iss
	echo ±‡“ÎÕÍ≥… ...
	pause
@echo on