@echo off
Mode con cols=54 lines=50
title Notepad--                                                        v0.0.1
set input=
set isDarkTheme=TRUE
set isGui=TRUE
set storagefolder=ShitNote
if NOT EXIST %storagefolder% MD %storagefolder%
cd %storagefolder%
::********************************************************************************************
:mHome
    if %isGui%==TRUE call :mLoadGui HOME
    echo [1] Create Note
    echo [2] List ^& ^Edit Notes
    echo [3] Delete All Notes
    echo [4] Commands ^& Settings
    echo:
    set /p input=
    if %input% ==1 goto mWrite
    if %input% ==2 goto mList 
    if %input% ==3 goto mDelete
    if %input% ==4 goto :mCommands 
    call :mInputChecker menu
    goto :mHome
:
::********************************************************************************************
:mList
    if %isGui%==TRUE call :mLoadGui WRITE TO EXISTING FILE
    set /a counter=0
    for %%x IN (*.txt) DO echo %%x & set counter=+1
    if counter==0 ( echo No Files Fond! & echo: ) else ( 
        echo:
        echo To Edit Enter [filname.txt]
        set /p input=
        goto :mEdit %input%
    )
    echo:
    set /p input=
    goto :home 
    
::********************************************************************************************
:mWrite
    if %isGui%==TRUE call :mLoadGui WRITE TO NEW FILE
    echo:
    echo Enter File Name:
    set filetype=.txt
    set /p filename=
    echo filename
    pause 
    if %isGui%==TRUE call :mLoadGui %filename%
       
        :writer
            set /p input=
                if %input%==/quit goto :mHome
            %input% >> filename
        goto :writer    

goto :mHome
EXIT /B
:
::********************************************************************************************
:mEdit
    if %isGui%==TRUE call :mLoadGui %~1
        :writer
            set /p input=
                if %input%==/quit goto :mHome
            %input% > %~1
        goto :writer    
goto :mHome
EXIT /B
:
::********************************************************************************************
:mDelete
    if %isGui%==TRUE call :mLoadGui DEATH
    echo NOT TESTED DO NOT USE
    echo THIS WILL DELETE ALL .txt FILES IN CURRENT DIR!
    echo ["DELETEIMUS-MAXIMUS"] To Confirm:
    
        set /r input=
            if(input==DELETEMUS-MAXIMUS) DEL *.txt
            call :mInputChecker
goto :mHome
::********************************************************************************************
:mInputChecker
    ::POWERUSER::
    if %input% ==pokqwd goto :mHome
    if %input% ==qwdpok goto :mPowersyntax
    if %input% ==qwepok goto :mPowerUser
    if %input% ==asdpok goto :mWrite

    ::NOOBSYNTAX::
    if %input% ==/help call :mCommands
    if %input% ==/home call :mHome
    if %input% ==/settings call :mSettings
    if %input% ==/poweruser call :mPowerUser
    if %input% ==/exit goto :mExit
    if %~1==menu goto:mHome
:
::********************************************************************************************
:mCommands
    if %isGui%==TRUE call :mLoadGui COMMANDS
    echo Can be used ^at any ^time!
    echo:
    echo /help
    echo /home
    echo /settings
    echo /poweruser
    echo /exit
    echo:
    set /p input=
    call :mInputChecker 0
    goto :mCommands 
:
::********************************************************************************************
:mSettings
    if %isGui%==TRUE call :mLoadGui SETTINGS
    echo [1] Turn OFF/ON GUI
    echo - Commonly Used by Security Agencies like NSA, KGB
    echo aswell as enthusiasts and powerusers to optimize performance. 
    echo [2] Toggle Dark / Light Theme
    echo:
    set /p input=     
       
        if %input%==1 (
            if %isGui%==TRUE (
                set isGui=FALSE
                echo 1 isGUI: %isGui%
                    ) else (
                        echo 2: isGUI: %isGui%
                        set isGui=TRUE
                    ) 
            )  
        
        if %input%==2 (
            if %isDarkTheme%==TRUE (
                set isDarkTheme=FALSE
                echo 2 %isDarkTheme%
                    ) else (
                        echo 3 %isDarkTheme%
                        set isDarkTheme=TRUE
                    ) 
            )  
    call :mInputChecker 0
    goto :settings 
:
::********************************************************************************************
:mPoweruser
    if %isGui%==TRUE call :mLoadGui POWERUSER
    echo Notepad-- is without question one of the most popular,
    echo breathtaking computer software ever achivement by Mankind.
    echo Both major corporations and startups rely on this
    echo note-taking powerhouse to stay ahead. 
    echo Harvesting its potential can open up a whole myriad
    echo of career opportunities in industries such as finance,
    echo consulting, analytics and every other role you can name. 
    echo:
    echo                     USER'S REVIEWS:
    ECHO:
    echo                ''Change your life today.
    echo                Dont't gamgle on the future,
    echo                 act now, without delay''
    echo                     -Barack Obama 
    echo:
    echo     ''It's the change you want to see in the world''
    echo                     -Mahatma Gandhi
    echo:
    echo             [1]''Become A Power User Today!''
    echo                     -HackerMan1337
    echo             [/command]   
    echo:
    set /p input=
    call :mInputChecker 0
    goto :mPowersyntax
:
::********************************************************************************************
:mPowersyntax
    if %isGui%==TRUE call :mLoadGui POWERSYNTAX
    echo [qwdpok] = PowerUser/Syntax               
    echo [pokqwd] = Home
    echo [qwepok] = New File
    echo:
    
    set /p input=
    call :mInputChecker 0
    goto :mPowersyntax
:
::********************************************************************************************
:mLoadGui 
    cls
    echo:
    echo   _   _       _                       _          
    echo  ^| \ ^| ^| ___ ^| ^|_ ___ _ __   __ _  __^| ^|       
    echo  ^|  \^| ^|/ _ \^| __/ _ \ '_ \ / _` ^|/ _` ^|_____ _____
    echo  ^| ^|\  ^| (_) ^| ^|^|  __/ ^|_) ^| (_^| ^| (_^| ^|_____^|_____^|  
    echo  ^|_^| \_^|\___/ \__\___^| .__/ \__,_^|\__,_^|
    echo                      ^|_^|
    echo:
    ::DIR PARAM
    echo ----%1----
    echo:
EXIT /B
:
::********************************************************************************************
:mExit
    pause
    exit
: