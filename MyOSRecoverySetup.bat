@echo off
title MyOS Setup v2.0.0
set "currentDirectory=%cd%"
set "newDir=%cd%"
set "BootloaderChoice=On"
set "ExitChoice=No"
echo Loading Setup...
timeout /T 5 /NOBREAK >nul
goto SetupVer
:SetupVer
ver | findstr /i "10\.0\." > nul
if %ERRORLEVEL% EQU 0 (
	goto Setup
) else (
	goto SetupOLD
)
:Setup
cls
echo Welcome to the MyOS Setup. The Setup will download, install and prepare MyOS on your computer. Choose from any of the options below:
echo.
echo 1 - Download the newest version of MyOS and install it on the computer
echo 2 - Close Setup
echo.
choice /C 1234 /N /M "Choice: "
if %ERRORLEVEL% == 1 goto InstallInternet
if %ERRORLEVEL% == 2 goto ExitConfirm
:InstallInternet
cls
echo This setup is ONLY compatible with Windows 10 (Threshold 2 or later). Proceed? Y/N
choice /N
if %ERRORLEVEL% == 2 goto Setup
timeout /T 1 /NOBREAK >nul
set chosen=1
goto InstallInternetDIR
:InstallInternetDIR
cls
echo                                           MyOS cfdisk-like interface (v1.0.0)
echo                      Current Directory: %currentDirectory%
echo.  
echo.
echo.
if %chosen% == 1 (
	echo                      [47m[30m[Change Directory][0m [   Bootloader   ] [    Continue    ] [      Quit      ]
)
if %chosen% == 2 (
	echo                      [Change Directory] [47m[30m[   Bootloader   ][0m [    Continue    ] [      Quit      ]
)
if %chosen% == 3 (
	echo                      [Change Directory] [   Bootloader   ] [47m[30m[    Continue    ][0m [      Quit      ]
)
if %chosen% == 4 (
	echo                      [Change Directory] [   Bootloader   ] [    Continue    ] [47m[30m[      Quit      ][0m
)
for /F %%k in ('PowerShell Write-Host $Host.UI.RawUI.ReadKey(\"NoEcho,IncludeKeyDown\"^).VirtualKeyCode') do set "key=%%k"
if %key% == 37 (
	if %chosen% == 1 (
		set /a chosen=4
	) else (
		set /a chosen=%chosen%-1
	)
)
if %key% == 39 (
	if %chosen% == 4 (
		set /a chosen=1
	) else (
		set /a chosen=%chosen%+1
	)
)
if %key% == 13 (
	if %chosen% == 1 goto InstallInternetDIRChange
	if %chosen% == 2 goto InstallInternetDIRBootloader
	if %chosen% == 3 goto InstallInternetDownload
	if %chosen% == 4 goto InstallInternetDIRExit
)
goto InstallInternetDIR
:InstallInternetDIRChange
cls
setlocal EnableDelayedExpansion
echo                                           MyOS cfdisk-like interface (v1.0.0)
echo                      Current Directory: %currentDirectory%
echo.  
echo.
echo.
set /p "newDir=              Primary Directory: "
if exist %newDir% (
	set "currentDirectory=%newDir%"
	cd %currentDirectory%
	timeout /T 1 /NOBREAK >nul
	goto InstallInternetDIR
) else (
	echo This directory does not exist. Would you like to create it? Y/N
	choice /N
	if !ERRORLEVEL! == 1 (
		mkdir %newDir%
		set "currentDirectory=%newDir%"
		cd %currentDirectory%
		endlocal
		timeout /T 1 /NOBREAK >nul
		goto InstallInternetDIR
	) else (
		endlocal
		timeout /T 1 /NOBREAK >nul
		goto InstallInternetDIR
	)
)
:InstallInternetDIRBootloader
cls
echo                                           MyOS cfdisk-like interface (v1.0.0)
echo                      Current Directory: %currentDirectory%
echo.  
echo.
echo.
if "%BootloaderChoice%" == "On" (
	echo                Bootloader [47m[30m[On][0m [Off]
) else (
	echo                Bootloader [On] [47m[30m[Off][0m
)
for /F %%k in ('PowerShell Write-Host $Host.UI.RawUI.ReadKey(\"NoEcho,IncludeKeyDown\"^).VirtualKeyCode') do set "key=%%k"
if %key% == 37 (
	if "%BootloaderChoice%" == "On" (
		set "BootloaderChoice=Off"
	) else (
		set "BootloaderChoice=On"
	)
)
if %key% == 39 (
	if "%BootloaderChoice%" == "On" (
		set "BootloaderChoice=Off"
	) else (
		set "BootloaderChoice=On"
	)
)
if %key% == 13 goto InstallInternetDIR
goto InstallInternetDIRBootloader
:InstallInternetDownload
cls
echo Contacting Servers...
Ping www.github.com/Duckloveshack -n 1 -w 1000 >nul
if %ERRORLEVEL% != 0 (
	echo Seems like the server is down or your internet connection is unstable. Try again later.
	timeout /t 5 /nobreak >nul
	goto Setup
)
timeout /T 1 /NOBREAK >nul
cls
bitsadmin /transfer myDownloadJob /download /priority normal https://github.com/Duckloveshack/MyOS/raw/CHECKVERSION/CheckVersion.txt %cd%\CheckVersion.txt >nul
for /f "delims=" %%a in (Checkversion.txt) do (newest=%%a)
echo The newest version of MyOS available is %newest%. Would you like to install it? Y/N
choice /N
if %ERRORLEVEL% == 1 (
	if %BootloaderChoice% == "Off" (
		echo Downloading MyOS...
		bitsadmin /transfer myDownloadJob /download /priority normal https://github.com/Duckloveshack/MyOSSafe/raw/master/MyOSRecovery.bat %cd%\MyOS.bat >nul
		timeout /t 1 /nobreak >nul
		echo MyOS has been successfully installed. You can close this window now.
		timeout /t -1 /nobreak >nul
		exit
	) else (
		echo Downloading MyOS...
		bitsadmin /transfer myDownloadJob /download /priority normal https://github.com/Duckloveshack/MyOSSafe/raw/installer/MyOSBLRecovery.bat %cd%\MyOS.bat >nul
		timeout /t 1 /nobreak >nul
		echo Installing Bootloader...
		goto InstallInternetDownloadBL
)
goto InstallInternetDIR
:InstallInternetDownloadBL
set MyOSDIR=%cd%
cd %temp%
if exist MOSBL.bat (
	bitsadmin /transfer myDownloadJob /download /priority normal https://github.com/Duckloveshack/MyOS/raw/CHECKVERSION/CheckVersion.txt %cd%\CheckVersion.txt >nul
	for /f "delims=;" %%a in (CheckVersion.txt) do (set CurrentVER=%%a && goto InstallInternetDownloadBLExist)
) else (
	bitsadmin /transfer myDownloadJob /download /priority normal https://github.com/Duckloveshack/MyOSSafe/raw/installer/MyOSBootloaderRecovery.bat %cd%\MyOS.bat >nul
	echo (MyOS-%CurrentVER%) > mosbl.list
	echo (%MyOSDIR%) >> mosbl2.list
	timeout /t 1 /nobreak >nul
	echo MyOS has been successfully installed. You can close this window now.
	timeout /t -1 /nobreak >nul
	exit
)
:InstallInternetDownloadBLExist
echo (MyOS-%CurrentVER%) >> mosbl.list
echo (%MyOSDIR%) >> mosbl2.list
timeout /t 1 /nobreak >nul
echo MyOS has been successfully installed. You can close this window now.
timeout /t -1 /nobreak >nul
exit
:InstallInternetDIRExit
cls
echo                                           MyOS cfdisk-like interface (v1.0.0)
echo                      Current Directory: %currentDirectory%
echo.  
echo.
echo.
if "%ExitChoice%" == "No" (
	echo                Exit [47m[30m[No][0m [Yes]
) else (
	echo                Exit [No] [47m[30m[Yes][0m
)
for /F %%k in ('PowerShell Write-Host $Host.UI.RawUI.ReadKey(\"NoEcho,IncludeKeyDown\"^).VirtualKeyCode') do set "key=%%k"
if %key% == 37 (
	if "%ExitChoice%" == "No" (
		set "ExitChoice=Yes"
	) else (
		set "ExitChoice=No"
	)
)
if %key% == 39 (
	if "%ExitChoice%" == "No" (
		set "ExitChoice=Yes"
	) else (
		set "ExitChoice=No"
	)
)
if %key% == 13 (
	if "%ExitChoice%" == "No" (
		timeout /T 1 /NOBREAK >nul
		goto InstallInternetDIR
	) else (
		timeout /T 1 /NOBREAK >nul
		exit
	)
)
goto InstallInternetDIRExit
:ExitConfirm
cls
echo Are you sure you want to exit the setup? Y/N
choice /N
if %ERRORLEVEL% == 1 exit
if %ERRORLEVEL% == 2 goto Setup

:SetupOLD
cls
title MyOS Setup
echo Welcome to the MyOS Installation Wizard. Choose from an option below.
echo NOTE: Bootloader functions are not available on legacy installers.
echo To Download the Newest Version of MyOS, Press [1]
echo To Exit the Installation, Press [2]
set /p Choice= 
if %Choice% == 1 goto OnlineSetupOLD
if %Choice% == 2 exit
echo Invalid Symbol. Please Choose Between [1] or [2].
timeout /T 2 /NOBREAK >nul
goto SetupOLD
:OnlineSetupOLD
bitsadmin /transfer myDownloadJob /download /priority normal https://github.com/Duckloveshack/MyOSSafe/raw/master/MyOSRecovery.bat %cd%\MyOS.bat >nul
cls
title Installing_MyOS
echo To start the installation, press [ENTER].
pause >nul
cls
set i = 0
goto loop
:loop
cls
echo Installing MyOS.
timeout /T 0 /NOBREAK >nul
cls
echo Installing MyOS..
timeout /T 0 /NOBREAK >nul
cls
echo Installing MyOS...
timeout /T 0 /NOBREAK >nul
if i lss 30 (
	set /a i = %i% + 1
	goto loop
) else (
	cls
	echo MyOS has been successfully installed. You can close this window now
	echo P.S. No need for setting up MyOS. You can do it inside MyOS itself.
	timeout /t -1 /nobreak >nul
	exit
)