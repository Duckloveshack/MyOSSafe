@echo off
::MyOS BootLoader
::MyOS BootLoader is used to boot different versions of MyOS or entering Safe Mode in the chosen version
::MSE stands for: MyOS System Extension
if not exist options.mse (
	goto OptionsCorrupt
)
find /c "OPTNumber" options.mse >nul
if %ERRORLEVEL% == 1 goto OptionsCorrupt
find /c "OPTDefault" options.mse >nul
if %ERRORLEVEL% == 1 goto OptionsCorrupt
type options.mse>optionsimport.bat
call optionsimport.bat
del optionsimport.bat /s /q >nul
goto BootloaderBoot
:BootloaderBoot
choice /T 1 /C 3D /D 3 >nul 
if %ERRORLEVEL% == 2 @echo on
title MyOS Bootloader
for /f %%i in ('find /v /c "" ^< mosbl.list') do set OSes=%%i
if %OSes% == 0 (
	echo.
	echo No Operating Systems Found!
	echo.
	timeout /t -1 /nobreak >nul
	exit
)
if %OSes% == 1 (
	setlocal EnableDelayedExpansion
	title MyOS Bootloader [Hold S for Safe Mode]
	for /f "delims=" %%a in (mosbl2.list) do (cd %%a)
	choice /T 1 /C 5S /D 5 >nul
	echo !ERRORLEVEL! > bootargs.myos
	MyOS.bat
	exit
)
if %OSes% gtr 1 goto OSChooserPreUI
:OSChooserPreUI
if %OPTNumber% == 0 (
	goto OSChooser
) else (
	goto OSChooserALT
)
:OSChooser
cls
echo MyOS BootLoader v1.0.0
echo.
echo Choose a version to load: [Type O for Options]
echo.
type mosbl.list
echo.
set /p OSChoice=OS: 
if %OSChoice% == O goto Options
find "%OSChoice%" mosbl.list && (
	set /a WorkingLine=0
	goto OSChooserPreBoot
) || (
	echo.
	echo This Operating System Is Not Found!
	timeout /t 1 /nobreak >nul
	goto OSChooserPreUI
)
:Options
cls
echo MyOS Bootloader v1.0.0
echo Options
echo.
if %OPTNumber% == 0 (
	echo 1 - Bootloader Input = By Name
) else (
	echo 1 - Bootloader Input = By Order
)
echo.
echo 2 - Default Operating System - Number %OPTDefault% (Currently Only Works with Bootloader Input = By Order)
echo.
echo 3 - Go Back
echo.
set /p Choice="Choice: "
if %Choice% == 1 (
	if %OPTNumber% == 0 (
		set OPTNumber=1
		goto OptionsEditing
	) else (
		set OPTNumber=0
		goto OptionsEditing
	)
)
if %Choice% == 2 (
	echo.
	echo Type The Number of the Default System. If the number is higher than the list, it will be set to 1
	echo.
	set /p OPTDefault=
	goto OptionsDefaultCompare
)
if %Choice% == 3 goto OSChooserPreUI
goto Options
:OptionsDefaultCompare
if %OPTDefault% lss 0 set OPTDefault=1
if %OPTDefault% gtr %OSes% set OPTDefault=1
goto OptionsEditing
:OptionsEditing
echo @echo off > options.mse
echo set OPTNumber=%OPTNumber% >> options.mse
echo set OPTDefault=%OPTDefault% >> options.mse
goto Options
:OptionsCorrupt
title CORRUPTED SETTINGS - MYOS BOOTLOADER
echo The Options Are Missing Or Corrupted. The Default Settings will be applied.
timeout /t 3 /nobreak >nul
echo @echo off > options.mse
echo set OPTNumber=0 >> options.mse
echo set OPTDefault=1 >> options.mse
type options.mse>optionsimport.bat
call optionsimport.bat
del optionsimport.bat /s /q >nul
goto BootloaderBoot
:OSChooserPreBoot
if %WorkingLine% == 0 (
	set WorkingLineStringSkip="delims=;"
) else (
	set WorkingLineStringSkip="skip=%WorkingLine% delims=;" 
)
for /f %WorkingLineStringSkip% %%a in (mosbl.list) do (set WorkingLineString=%%a && goto OSChooserPrebootPhase2)
:OSChooserPrebootPhase2
if %OSChoice% == %WorkingLineString% (
	title MyOS Bootloader [Hold S for Safe Mode]
	for /f %WorkingLineStringSkip% %%a in (mosbl2.list) do (set WorkingPath=%%a && goto OSChooserBoot)
) else (
	set /a WorkingLine = %WorkingLine% + 1
	goto OSChooserPreBoot
)
:OSChooserBoot
cd %WorkingPath%
choice /T 1 /C 5S /D 5 >nul
set Boot=%ERRORLEVEL%
title MyOS Bootloader
echo %Boot% >bootargs.myos
timeout /t 1 /nobreak >nul
MyOS.bat
exit
:OSChooserALT
cls
set OSChoice=%OPTDefault%
echo MyOS Bootloader v1.0.0
echo.
echo Choose a version to load (By Order) (Type O for Options):
echo.
type mosbl.list
echo.
set /p OSChoice="Choice: "
if %OSChoice% == O goto Options
if %OSChoice% gtr %OSes% (
	echo Invalid Choice
	timeout /T 1 /NOBREAK >nul
	goto OSChooserALT
)
if %OSChoice% lss 0 (
	echo Invalid Choice
	timeout /T 1 /NOBREAK >nul
	goto OSChooserAlt
) else (
	goto OSChooserALTPreBoot
)
:OSChooserALTPreBoot
cls
set /a WorkingLine=%OSChoice%-1
if %WorkingLine% == 0 (
	set WorkingLineStringSkip="delims=;"
) else (
	set WorkingLineStringSkip="skip=%WorkingLine% delims=;" 
)
title MyOS Bootloader [Hold S for Safe Mode]
for /f %WorkingLineStringSkip% %%a in (mosbl2.list) do (set WorkingPath=%%a && goto OSChooserBoot)