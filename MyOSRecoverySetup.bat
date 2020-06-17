@echo off
echo Starting Setup 0%%   [                                                                                                      ] 
timeout /T 1 /NOBREAK   >nul
cls
echo Starting Setup 1%%   [=                                                                                                     ] 
timeout /T 1 /NOBREAK   >nul
cls
echo Starting Setup 2%%   [==                                                                                                    ] 
timeout /T 1 /NOBREAK   >nul
cls
echo Starting Setup 3%%   [===                                                                                                   ] 
timeout /T 1 /NOBREAK   >nul
cls
echo Starting Setup 4%%   [====                                                                                                  ] 
timeout /T 1 /NOBREAK   >nul
cls
echo Starting Setup 5%%   [=====                                                                                                 ] 
timeout /T 1 /NOBREAK   >nul
cls
echo Starting Setup 10%%  [==========                                                                                            ] 
timeout /T 1 /NOBREAK   >nul
cls
echo Starting Setup 16%%  [================                                                                                      ] 
timeout /T 1 /NOBREAK   >nul
cls
echo Starting Setup 25%%  [=========================                                                                             ] 
timeout /T 1 /NOBREAK   >nul
cls
echo Starting Setup 38%%  [=======================================                                                               ] 
timeout /T 1 /NOBREAK   >nul
cls
echo Starting Setup 62%%  [===============================================================                                       ] 
timeout /T 1 /NOBREAK   >nul
cls
echo Starting Setup 89%%  [===========================================================================================           ] 
timeout /T 1 /NOBREAK   >nul
cls
echo Starting Setup 100%% [======================================================================================================] 
timeout /T 1 /NOBREAK   >nul
cls
timeout /T 8 /NOBREAK   >nul
goto SetupIntroduction
:SetupIntroduction
cls
title MyOS Setup
echo Welcome to the MyOS Installation Wizard. Choose from an option below.
echo To Start the Offline Installation, Press [1]
echo To download the newest version of MyOS, Press [2]
echo To Exit the Installation, Press [3]
echo To View the Changelog, Press [4]
echo To run a Demo-Version of MyOS, Press [5]
set /p Choice= 
if %Choice% == 1 goto setup
if %Choice% == 2 goto onlinesetup
if %Choice% == 3 exit
if %Choice% == 4 goto schange
if %Choice% == 5 goto MyLive
echo Invalid Symbol. Please Choose Between [1], [2], [3] or [4].
timeout /T 2 /NOBREAK >nul
goto SetupIntroduction
:schange
cls
timeout /T 0 /NOBREAK >nul
echo MyOS Changelog:
echo Version 0.0.1
echo The first alpha release.
echo Version 0.0.2 
echo Text Editor release
echo Version 0.0.3
echo Added "MyOS App Sample" and "ReadME MyOS". Introduced "MyOS 3rd Party App Launcher".
echo Version 0.1.0 (BETA 1)
echo Updated Kernel. Added Multi-Solve in Calculator. Deleted Log Off option because of a bug.
echo Version 0.1.1 (BETA 1.1)
echo Readded Log Off option. Changed file view prefix in App Launcher and Text Editor
echo Version 0.2.0 (BETA 2)
echo Updated Kernel. Added Settings. You can change system colour and time with date! P.S. To Change time or date, use administrator privilages.
echo Version 0.2.1 (BETA 2.1)
echo The 3RD Party App Launcher now supports CMD apps!
echo Version 0.3.0 (Release Candidate 1)
echo Github Releases are easy accesible from Dektop! The guest mode was added!
echo Version 0.4.0 (Release Candidate 2)
echo Little update. Now all the empty choices won't crash the system.
echo Version 1.0.0
echo The first stable release of MyOS! The Safe Mode was added in case if normal mode is corrupted.
echo Version 1.1.0
echo Safe Mode can now restore the system!
echo Version 1.1.1
echo Bug Fixes. Now safe mode installs the newest version of MyOS
echo Version 1.1.2
echo Now you can update the system using the Update Option.
pause >nul
cls
echo Version 1.2.0
echo Now you can change User Properties. The Update Option was moved to settings.
echo Version 1.2.1
echo Bug-Fixes. Now you should confirm yourself when logging in Safe Mode
echo Version 1.3.0
echo Better folder recognition in 3PStore and TextPad. Text fix in Settings.
echo Version 1.4.0
echo Bug Fixes. Now apps detect if the file(s) exist.
echo Version 1.4.1
echo Bug Fixes.
echo Version 1.5.0
echo The App_Sample is no longer in the archive. MyOS will automatically generate some of the folders.
echo Version 1.6.0
echo Now the Guest Settings change a lot faster and easier! You can turn off the password!
echo Version 1.7.0
echo Merry Christmas! Now you can change the hint! The password changing to 0 bug was fixed!
echo Version 1.8.0
echo Bug Fixes. Now Text Pad is available in Safe Mode.
echo Version 1.9.0
echo The first release in 2020! The kernel was updated to version 1.2.0
echo Version 2.0.0
echo + BioProtect! Block with a password the system apps of MyOS
echo + MP3 Player! Play your favourite songs in MyOS
echo + PassProtect! Save your Passwords in files, accecible only in MyOS.
echo + Turn Off Safe Mode! If you don't need it, then you can still turn it off!
pause >nul
cls
echo Version 2.0.1
echo Settings Configurations! Set your settings everytime you boot.
echo Version 2.0.2
echo You can type up to 12 lines in text pad.
echo Version 2.1.0
echo + You can type up to 60 lines in Text Pad.
echo + The New Text Pad is avaiable in Safe Mode.
echo Version 2.2.0
echo + Fixed PassProtect Open Function
echo + PassProtect needs confirmation to delete passwords.
echo + Added hints for COVID-19
echo Version 2.3.0
echo + Update was overhauled
echo + About MyOS
echo.
pause >nul
echo MyOS Demo Changelog:
echo Version 0.1.0
echo The first version of MyOS Demo
echo Version 0.1.1
echo Bug Fixes
echo Version 0.2.0
echo Now MyOS generates the subfolders.
echo Version 0.3.0
echo Text Pad is now available!
echo Version 0.3.1
echo Added COVID-19 hints
pause >nul
goto SetupIntroduction


:MyLive
set /a UserName=1
set /a PassWord=123
set /a EX=0
set /a num1=0
set /a num2=0
set /a Answer=0
set /a App=0
set /a Color=00
set /a w=0
SET /a n=0
timeout /T 10 /NOBREAK >nul
cls
title MyOS (Demo)
echo 		MMMMMMMM               MMMMMMMM                              OOOOOOOOO        SSSSSSSSSSSSSSS 
echo 		M:::::::M             M:::::::M                            OO:::::::::OO    SS:::::::::::::::S
echo 		M::::::::M           M::::::::M                          OO:::::::::::::OO S:::::SSSSSS::::::S
echo 		M:::::::::M         M:::::::::M                         O:::::::OOO:::::::OS:::::S     SSSSSSS
echo 		M::::::::::M       M::::::::::Myyyyyyy           yyyyyyyO::::::O   O::::::OS:::::S            
echo 		M:::::::::::M     M:::::::::::M y:::::y         y:::::y O:::::O     O:::::OS:::::S            
echo 		M:::::::M::::M   M::::M:::::::M  y:::::y       y:::::y  O:::::O     O:::::O S::::SSSS         
echo 		M::::::M M::::M M::::M M::::::M   y:::::y     y:::::y   O:::::O     O:::::O  SS::::::SSSSS    
echo 		M::::::M  M::::M::::M  M::::::M    y:::::y   y:::::y    O:::::O     O:::::O    SSS::::::::SS  
echo 		M::::::M   M:::::::M   M::::::M     y:::::y y:::::y     O:::::O     O:::::O       SSSSSS::::S 
echo 		M::::::M    M:::::M    M::::::M      y:::::y:::::y      O:::::O     O:::::O            S:::::S
echo 		M::::::M     MMMMM     M::::::M       y:::::::::y       O::::::O   O::::::O            S:::::S
echo 		M::::::M               M::::::M        y:::::::y        O:::::::OOO:::::::OSSSSSSS     S:::::S
echo 		M::::::M               M::::::M         y:::::y          OO:::::::::::::OO S::::::SSSSSS:::::S
echo 		M::::::M               M::::::M        y:::::y             OO:::::::::OO   S:::::::::::::::SS 
echo 		MMMMMMMM               MMMMMMMM       y:::::y                OOOOOOOOO      SSSSSSSSSSSSSSS   
echo 		                                     y:::::y                                                  
echo 		DDDDDDDDDDDDD                       y:::::y                                                   
echo 		D::::::::::::DDD                   y:::::y                                                    
echo 		D:::::::::::::::DD                y:::::y                                                     
echo 		DDD:::::DDDDD:::::D              yyyyyyy                                                      
echo 		  D:::::D    D:::::D     eeeeeeeeeeee       mmmmmmm    mmmmmmm      ooooooooooo               
echo 		  D:::::D     D:::::D  ee::::::::::::ee   mm:::::::m  m:::::::mm  oo:::::::::::oo             
echo 		  D:::::D     D:::::D e::::::eeeee:::::eem::::::::::mm::::::::::mo:::::::::::::::o            
echo 		  D:::::D     D:::::De::::::e     e:::::em::::::::::::::::::::::mo:::::ooooo:::::o            
echo 		  D:::::D     D:::::De:::::::eeeee::::::em:::::mmm::::::mmm:::::mo::::o     o::::o            
echo 		  D:::::D     D:::::De:::::::::::::::::e m::::m   m::::m   m::::mo::::o     o::::o            
echo 		  D:::::D     D:::::De::::::eeeeeeeeeee  m::::m   m::::m   m::::mo::::o     o::::o            
echo 		  D:::::D    D:::::D e:::::::e           m::::m   m::::m   m::::mo::::o     o::::o            
echo 		DDD:::::DDDDD:::::D  e::::::::e          m::::m   m::::m   m::::mo:::::ooooo:::::o            
echo 		D:::::::::::::::DD    e::::::::eeeeeeee  m::::m   m::::m   m::::mo:::::::::::::::o            
echo 		D::::::::::::DDD       ee:::::::::::::e  m::::m   m::::m   m::::m oo:::::::::::oo             
echo 		DDDDDDDDDDDDD            eeeeeeeeeeeeee  mmmmmm   mmmmmm   mmmmmm   ooooooooooo
timeout /T 1 /NOBREAK >nul
cls
goto MyLiveLogin
:MyLiveLogin
cls
echo Welcome to MyOS Demo. Please type your username and password.
echo (NOTE: This version of MyOS is extremely limited due to it being just a demonstration.)
echo.
set /p Username=Username: 
goto MyLivePassword
:MyLivePassword
cls
echo Welcome to MyOS Demo. Please type your username and password. [Type [1] for hint]
echo (NOTE: This version of MyOS is extremely limited due to it being just a demonstration.)
echo.
echo Username: %Username%
set /p Password=Password: 
if %Password% == DuckLovesHack goto MyLiveDesktop
if %Password% == 1 goto MyLivePasswordHint
echo This is the wrong password. Please type the correct one.
timeout /T 3 /NOBREAK >nul
goto MyLivePassword
:MyLivePasswordHint
cls
echo Welcome to MyOS Demo. Please type your username and password.
echo (NOTE: This version of MyOS is extremely limited due to it being just a demonstration.)
echo Hint: The Password is "DuckLovesHack"
echo. 
echo Username: %Username%
set /p Password=Password: 
if %Password% == DuckLovesHack goto MyLiveDesktop
echo This is the wrong password. Please type the correct one.
timeout /T 3 /NOBREAK >nul
goto MyLivePassword
:MyLiveDesktop
set /a CoronaHint=%random%
timeout /T 1 /NOBREAK >nul
cls
echo Welcome, %Username%. Choose a program you wish to run.
if %CoronaHint% lss 1000 echo Hint: Wash your hands regularly!
if %CoronaHint% gtr 1000 if %CoronaHint% lss 3000 echo Hint: Don't touch your face with your hands!
if %CoronaHint% gtr 3000 if %CoronaHint% lss 5000 echo Hint: Stay at home!
if %CoronaHint% gtr 5000 if %CoronaHint% lss 7000 echo Hint: Be healthy!
if %CoronaHint% gtr 7000 if %CoronaHint% lss 9000 echo Hint: Don't panic!
if %CoronaHint% gtr 9000 echo Hint: Keep the distance of at least 2 meters!
echo 1 = Calculator
echo 2 = 3rd Party Launcher
echo 3 = Text Pad
echo 4 = Settings
echo 5 = MP3 Player
echo 6 = Other
set /p Choice=Program 
if %Choice% == 1 goto MyLiveCalculator
if %Choice% == 2 goto MyLive3rdPartyStore
if %Choice% == 3 goto MyLiveTextPad
if %Choice% == 4 goto MyLiveSettings
if %Choice% == 5 goto MyLiveMP3Player
if %Choice% == 6 goto MyLiveShutdownMenu
echo This command is unknown. Choose between existing apps.
timeout /T 1 /NOBREAK >nul
goto MyLiveDesktop
:MyLiveCalculator
cls
timeout /T 1 /NOBREAK >nul
echo Calculator - Version 1.0.0
echo 1 = Addition
echo 2 = Substraction
echo 3 = Multiplication
echo 4 = Division
echo 5 = Multi-Solve
echo 6 = Exit
set /p Sign=Number 
if %Sign% == 1 goto MyLiveCalculatorAddition
if %Sign% == 2 goto MyLiveCalculatorSubstraction
if %Sign% == 3 goto MyLiveCalculatorMultiplication
if %Sign% == 4 goto MyLiveCalculatorDivision
if %Sign% == 5 goto MyLiveCalculatorMultiSolve
if %Sign% == 6 goto MyLiveDesktop
echo Unknown command. Please choose a correct command.
timeout /T 1 /NOBREAK >nul
goto MyLiveCalculator
:MyLiveCalculatorAddition
cls
echo Please choose 2 numbers you wish to add
set /p num1=
set /p num2=%num1%+
set /a Answer=%num1%+%num2%
echo %num1%+%num2%=%answer%
pause >nul
goto MyLiveCalculator
:MyLiveCalculatorSubstraction
cls
echo Please choose 2 numbers you wish to substract
set /p num1=
set /p num2=%num1%-
set /a Answer=%num1%-%num2%
echo %num1%-%num2%=%answer%
pause >nul
goto MyLiveCalculator
:MyLiveCalculatorMultiplication
cls
echo Please choose 2 numbers you wish to multiply
set /p num1=
set /p num2=%num1%*
set /a Answer=%num1%*%num2%
echo %num1%*%num2%=%answer%
pause >nul
goto MyLiveCalculator
:MyLiveCalculatorDivision
cls
echo Please choose 2 numbers you wish to divide
set /p num1=
set /p num2=%num1%/
set /a Answer=%num1%/%num2%
echo %num1%/%num2%=%answer%
pause >nul
goto MyLiveCalculator
:MyLiveCalculatorMultiSolve
cls
echo Type the exercise you wish to solve
echo Addition = +
echo Substraction = -
echo Multiplication = *
echo Division = /
set /p EX=
set /a Answer=%EX%
echo %EX%=%Answer%
pause >nul
goto MyLiveCalculator
:MyLive3rdPartyStore
cls
if exist "MyOS.bat" (
	if not exist "MyOS Applications" (
		mkdir "MyOS Applications"
	)
	cd "MyOS Applications"
) else (
	cd..
	if exist "MyOS.bat" (
		if not exist "MyOS Applications" (
			mkdir "MyOS Applications"
		)
		cd "MyOS Applications"
	)
)
echo 3rd Party App Launcher Version 1.0.0
echo Please choose an application to run. (Without file extension) (Type [1] to exit)
dir /b
set /p App=App Name: 
if %App% == 1 goto desktop
if not exist %App%.bat (
	if not exist %App%.cmd (
		echo This application does not exist. Please choose another one.
		timeout /T 1 /NOBREAK >nul
		goto MyLive3rdPartyStore
	)
)
if exist %App%.cmd (
	start %App%.cmd
)
if exist %App%.bat (
	start %App%.bat
)
goto MyLiveDesktop
:MyLiveTextPad
cls
if exist "MyOS.bat" (
	if not exist "MyOS Text Files" (
		mkdir "MyOS Text Files"
	)
	cd "MyOS Text Files"
) else (
	cd..
	if exist "MyOS.bat" (
		if not exist "MyOS Text Files" (
			mkdir "MyOS Text Files"
		)
		cd "MyOS Text Files"
	)
)
title MyOS - Text Pad
echo Text Pad version 1.0.0
echo 1 = Create a new text file.
echo 2 = View existing text files.
echo 3 = Delete an existing file.
echo 4 = Exit
set /p Choice=Command 
if %Choice% == 1 goto createtext
if %Choice% == 2 goto viewtext
if %Choice% == 3 goto deltext
if %Choice% == 4 goto desktop
echo Invalid command. Please choose between existing commands.
timeout /T 1 /NOBREAK >nul
goto TEXTMENU
:createtext
cls
echo Please type the name of the text file you want to make. (It can't contain spaces) (Type [1] to exit)
set /p N=Name: 
if %N% == 1 goto MyLiveTextPad
cls
echo Write the text of the file. (You can't use [ENTER])
set /p W=
echo %W% > %N%.txt
timeout /T 0 /NOBREAK >nul
goto MyLiveTextPad
:viewtext
cls
echo Type the name of the file you wish to open (without file extension) (Type [1] to exit)
dir /b
set /p open=File Name 
if %open% == 1 goto MyLiveTextPad
if exist %open%.txt (
	notepad %open%
	pause >nul
	goto MyLiveTextPad
) else (
	echo The file does not exist.
	timeout /T 1 /NOBREAK >nul
	goto viewtext
)
:deltext
cls
echo Type the name of the file you wish to delete (without file extension) (Type [1] to exit)
dir /b
set /p delete=File Name 
if %delete% == 1 goto MyLiveTextPad
if exist %delete%.txt (
	del %delete%.txt /s /q >nul
	echo Deleting %delete.txt%
	timeout /T 1 /NOBREAK >nul
	goto MyLiveTextPad
) else (
	echo The file does not exist.
	timeout /T 1 /NOBREAK >nul
	goto deltext
)
:MyLiveSettings
cls
echo Settings - Version 1.0.0
echo 1 = System Colour
echo 2 = Exit
set /p Choice=Command 
if %Choice% == 1 goto MyLiveColour
if %Choice% == 2 goto MyLiveDesktop
echo Invalid Command. 
timeout /T 1 /NOBREAK >nul
goto MyLiveSettings
:MyLiveColour
cls
echo Choose the new color for your system
echo Here's the full list of the Operating System colour:
echo 0 - Black        8 - Gray
echo 1 - Dark-Blue    9 - Light-Blue
echo 2 - Green        A - Light-Green
echo 3 - Blue         B - Very Light Blue
echo 4 - Red          C - Light-Red
echo 5 - Purple       D - Light-Purple
echo 6 - Yellow       E - Light-Yellow
echo 7 - Light-Gray   F - White
echo Type like this: 38 (Blue Background And Gray Text)
set /p Color=Your Colour: 
color %Color%
timeout /T 0 /NOBREAK >nul
goto MyLiveSettings
:MyLiveMP3Player
cls
taskkill  /F /IM wmplayer.exe 1>nul 2>nul
if exist "MyOS.bat" (
	if not exist "MyOS MP3 Files" (
		mkdir "MyOS MP3 Files"
	)
	cd "MyOS MP3 Files"
) else (
	cd..
	if exist "MyOS.bat" (
		if not exist "MyOS MP3 Files" (
			mkdir "MyOS MP3 Files"
		)
		cd "MyOS MP3 Files"
	)

)
title MyOS - MP3 Player
echo MP3 Player - Version 1.0.0
echo This product is still in development, wait for 2.0.0 to be released.
echo.
echo Choose a soundtrack to play: [Type with extension] [Type [1] to exit]
dir /b
set /p Song=Song: 
if %Song% == 1 goto MyLiveDesktop
if exist %Song% (
	start wmplayer.exe "%cd%\%Song%" /min
	goto MyLiveMP3Play
)
echo This piece of music doesn't exist. Please type a valid one
timeout /T 1 /NOBREAK >nul
goto MyLiveMP3Player
:MyLiveMP3Play
cls
title MyOS - MP3 Player - Now Playing %Song%
echo Now Playing - %Song%
echo.
echo What do you want to do?
echo 1 = Choose another song
echo 2 = Exit and stop
set /p Choice=Choice: 
if %Choice% == 1 goto MyLiveMP3Player
if %Choice% == 2 (
	taskkill  /F /IM wmplayer.exe
	goto MyLiveDesktop
)
echo This choice is undefined.
timeout /T 1 /NOBREAK >nul
goto MiLiveMP3Play
:MyLiveShutdownMenu
cls
echo Choose an option:
echo 1 = Install MyOS
echo 2 = Restart
echo 3 = Exit
set /p Choice=Option: 
if %Choice% == 1 goto SetupIntroduction
if %Choice% == 2 goto MyLive
if %Choice% == 3 goto MyLiveDesktop
echo Invalid Option. Choose between [1], [2] or [3].
timeout /T 5 /NOBREAK >nul
goto MyLiveShutdownMenu

:onlinesetup
echo Please type the product key for installation.
set /p Choice=Key 
if %Choice% == 3GTHT-0GCSM-103QA-MOM09-CREEP goto onlineinstall
echo Invalid OEM key. Please rewrite the key
timeout /T 1 /NOBREAK >nul
goto onlinesetup
:onlineinstall
cls
echo Installing...
bitsadmin /transfer myDownloadJob /download /priority normal https://github.com/Duckloveshack/MyOSSafe/raw/master/MyOSRecovery.bat %cd%\MyOS.bat >nul
bitsadmin /transfer myDownloadJob /download /priority normal https://github.com/Duckloveshack/MyOSSafe/raw/master/MyOSRecoveryProductKey.txt "%cd%\OEM Key for MyOS".txt >nul
bitsadmin /transfer myDownloadJob /download /priority normal https://github.com/Duckloveshack/MyOSSafe/raw/master/MyOSRecoverySetup.bat "%cd%\MyOS Installation".bat >nul
:setup
cls
timeout /T 3 /NOBREAK >nul
echo Please type the product key for installation.
set /p Choice=Key 
if %Choice% == 3GTHT-0GCSM-103QA-MOM09-CREEP goto install
echo Invalid OEM key. Please rewrite the key
timeout /T 1 /NOBREAK >nul
goto setup
:install
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
	set i = i + 1
	goto loop
) else (
	cls
	echo It is recommended to set up MyOS. Proceed? Y/N
	choice /D Y /T 10 >nul
	if ERRORLEVEL 1 goto SETUPMYOS
	echo MyOS is now installed. To restart, press [ENTER]
	pause >nul
	cls
	start MyOS.bat
)
:SETUPMYOS
cls
echo W A I T   P L E A S E . . .
timeout /T 4 /NOBREAK >nul
cls
echo First of all, how would you like to be called?
set /p SETUsername=Answer: 
cls
echo OK, %SETUsername%, we value your security. Would you like to set a password? Y/N
choice >nul
if ERRORLEVEL 1 goto SETUPMYOSPASSWORD
else (
	set SETPasswordOn=123
	set SETPassword=DuckLovesHack
	goto SETUPMYOSNOPASS
)
:SETUPMYOSPASSWORD
cls
echo Type your password. We recommend you using random letters and numbers, so the password would be impossible to guess.
set /p SETPassword=Password: 
goto SETUPMYOSPASSWORDCONFIRM
:SETUPMYOSPASSWORDCONFIRM
cls
echo Confirm your password. It should be identical to the password you have written earlier.
set /p SETPasswordCheck2=Password: 
if %SETPasswordCheck2% == %SETPasswordCheck1% (
	set SETPasswordOn=100
	set SETPassword=%SETPasswordCheck1%
	goto SETUPMYOSNOPASS
) else goto SETUPMYOSPASSWORD
:SETUPMYOSNOPASS
cls
echo W A I T   P L E A S E . . .
echo Writting data to MyOS...
echo Do Not Close this Window.
(
echo @echo off
echo echo 0 ^> %TMP%\MyOSMP3PRO
echo echo 100 ^> %TMP%\MyOSSafeMode
echo echo %SETPassword% ^> %TMP%\MyOSPassWord 
echo echo 100 ^> %TMP%\MyOSGuestMode 
echo echo 100 ^> %TMP%\MyOSGuestModeCalc 
echo echo 100 ^> %TMP%\MyOSGuestModeChange 
echo echo 123 ^> %TMP%\MyOSGuestMode3PLaunch 
echo echo 123 ^> %TMP%\MyOSGuestModeTextPad 
echo echo 123 ^> %TMP%\MyOSGuestModeSettings 
echo echo 123 ^> %TMP%\MyOSGuestModeReleases 
echo echo 100 ^> %TMP%\MyOSGuestModeMP3Player 
echo echo %SETPasswordOn% ^> %TMP%\MyOSPasswordOn 
echo echo 0 ^> %TMP%\MyOSBioProtectCalc 
echo echo 0 ^> %TMP%\MyOSBioProtectChange 
echo echo 0 ^> %TMP%\MyOSBioProtect3PStore 
echo echo 0 ^> %TMP%\MyOSBioProtectTextPad 
echo echo 0 ^> %TMP%\MyOSBioProtectSettings 
echo echo 0 ^> %TMP%\MyOSBioProtectReleases 
echo echo 0 ^> %TMP%\MyOSBioProtectMP3Player 
echo echo 0 ^> %TMP%\MyOSBioProtectPassProtect 
echo echo "The Password is %SETPassword%" ^> %TMP%\MyOSHint 
) > Configuration.myosconfig
timeout /T 1 /NOBREAK >nul
echo MyOS is now installed. To restart, press [ENTER]
pause >nul
cls
start MyOS.bat