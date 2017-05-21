@echo off
title ExtDB3 Automatic Installer
echo Welcome, This cmdline applet will automaticaly download and install the ExtDB3 upgrade for exile.
echo Welcome, This DOES NOT update your mission file, that must be done by you.
pause
set mypath=%cd%
mkdir @ExileServer\sql_custom\
mkdir @ExileServer\logs\
powershell -command "& { iwr https://bitbucket.org/torndeco/extdb3/downloads/extDB3-1028.7z -OutFile tmp.7z }"
7z x tmp.7z -o*
xcopy /Y tmp\@extDB3\* @ExileServer\ /e /i /C
del tmp\*.txt 
xcopy /Y tmp\*.dll "%mypath%"
@echo off
cls
title Extdb3 Auto Configuration Utility.
echo Welcome, this tool will help you configure your copy of extdb3
set /p ip=Database ip ;
set /p dbn=Database Name (SchemaName) ;  
set /p user=Database Username ; 
set /p pass=Database Password ; 
echo [Main] > "@ExileServer\extdb3-conf.ini"
echo Version = 1 >> "@ExileServer\extdb3-conf.ini"
echo Randomize Config File = false >> "@ExileServer\extdb3-conf.ini"
echo ;; Randomizes Config File after loading. >> "@ExileServer\extdb3-conf.ini"
echo ;; Recommend to turn on, if you have enabled filepatching on arma. >> "@ExileServer\extdb3-conf.ini"
echo Allow Reset = false >> "@ExileServer\extdb3-conf.ini"
echo ;; Allows 9:RESET, usefull for development work >> "@ExileServer\extdb3-conf.ini"
echo Thread = 0; >> "@ExileServer\extdb3-conf.ini"
echo ;; Option to force number of worker threads for extDB3. >> "@ExileServer\extdb3-conf.ini"
echo ;; Min = 2, Max = 6 >> "@ExileServer\extdb3-conf.ini"
echo [Log] >> "@ExileServer\extdb3-conf.ini"
echo Flush = true; >> "@ExileServer\extdb3-conf.ini"
echo ;; Flush logfile after each update. >> "@ExileServer\extdb3-conf.ini"
echo ;; Option really only usefull if running DEBUG BUILD >> "@ExileServer\extdb3-conf.ini"
echo [exile] >> "@ExileServer\extdb3-conf.ini"
echo IP = %ip% >> "@ExileServer\extdb3-conf.ini"
echo Port = 3306 >> "@ExileServer\extdb3-conf.ini"
echo Username = %user% >> "@ExileServer\extdb3-conf.ini"
echo Password = %pass% >> "@ExileServer\extdb3-conf.ini"
echo Database = %dbn% >> "@ExileServer\extdb3-conf.ini"
echo ;; This File was automaticaly generated durring the install of extdb3 >> "@ExileServer\extdb3-conf.ini"
del tmp.7z
rmdir /Q /S tmp
echo Install complete, Please ensure you have updated your mission file and your sql_custom file to match the requirements.
echo Refer to the install guide automated installation section for further installation steps.
pause