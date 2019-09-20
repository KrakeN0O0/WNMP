@ECHO OFF
set ver=v2.0
TITLE KrakeN Server Console
:start
echo -------------------------------------------------------------------
echo Welcome to KrakeN Server Console!
echo -------------------------------------------------------------------
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

   ECHO  Please, choose:
   ECHO ===============================================================================
   ECHO = 11 - Start Server                                                           =
   ECHO = 12 - Reboot Apache                                                          =
   ECHO = 13 - Reboot Server (Apache + MariaDB)                                       =
   ECHO ===============================================================================
   ECHO = 21 - Install Server and Start                                               =
   ECHO = 22 - Install Server                                                         =
   ECHO ===============================================================================
   ECHO = 31 - Stop Server                                                            =
   ECHO ===============================================================================
   ECHO = 41 - Stop Server and Delete All Components                                  =
   ECHO ===============================================================================
   ECHO = 51 - Run ApacheMonitor                                                      =
   ECHO ===============================================================================
   ECHO = 61 - Listen Port 80                                                         =
   ECHO ===============================================================================
   ECHO = 71 - Open localhost                                                         =
   ECHO = 72 - Open Server Files Directory                                            =
   ECHO ===============================================================================
   ECHO = 0 - Exit                                                                    =
   ECHO ===============================================================================
   echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 
set /p ACTIONLEVEL=Choose and press ENTER:
 
IF "%ACTIONLEVEL%"=="0" (
   echo Exit...
   exit
   )
 
IF "%ACTIONLEVEL%"=="11" (
   CLS
   echo KrakeN Server %ver%
   echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   echo Starting Apache...                                                =
   d:\Server\bin\Apache24\bin\httpd.exe -k start
   echo Starting MariaDB...                                               =
   net start mysql
   echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   echo If no errors, all is OK
   pause
   goto start
   )
 
 IF "%ACTIONLEVEL%"=="12" (
   CLS
   echo KrakeN Server %ver%
   echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   echo Restarting Apache...                                              =
   d:\Server\bin\Apache24\bin\httpd.exe -k restart
   echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   echo If no errors, all is OK
   pause
   goto start
   )
 IF "%ACTIONLEVEL%"=="13" (
   CLS
   echo KrakeN Server %ver%
   echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   echo Restarting Apache...                                              =
   d:\Server\bin\Apache24\bin\httpd.exe -k restart
   echo Restarting MariaDB...                                             =
   net stop mysql
   net start mysql
   echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   echo If no errors, all is OK
   pause
   goto start
   )
 
IF "%ACTIONLEVEL%"=="21" (
   CLS
   echo KrakeN Server %ver%
   echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   echo Installing Apache...                                              =
   d:\Server\bin\Apache24\bin\httpd.exe -k install
   echo Starting Apache...                                                =
   d:\Server\bin\Apache24\bin\httpd.exe -k start
   echo Installing MariaDB...                                             =
   d:\Server\bin\mariadb\bin\mysqld --install
   echo Starting MariaDB...                                               =
   net start mysql
   echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   echo If no errors, all is OK
   pause
   goto start
   )
 
IF "%ACTIONLEVEL%"=="22" (
   CLS
   echo KrakeN Server %ver%
   echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   echo Installing Apache...                                              =
   d:\Server\bin\Apache24\bin\httpd.exe -k install
   echo Installing MariaDB...                                             =
   d:\Server\bin\mariadb\bin\mysqld --install
   echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   echo If no errors, all is OK
   pause
   goto start
   )
 
IF "%ACTIONLEVEL%"=="31" (
   CLS
   echo KrakeN Server %ver%
   echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   echo Stoping Apache...                                                 =
   d:\Server\bin\Apache24\bin\httpd.exe -k stop
   echo Stoping MariaDB...                                                =
   net stop mysql
   echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   echo If no errors, all is OK
   pause
   goto start
   )
 
   IF "%ACTIONLEVEL%"=="41" (
   CLS
   echo KrakeN Server %ver%
   echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   echo Stoping Apache...                                                 =
   d:\Server\bin\Apache24\bin\httpd.exe -k stop
   echo Deleting Apache...                                                =
   d:\Server\bin\Apache24\bin\httpd.exe -k uninstall
   echo Stoping MariaDB...                                                =
   net stop mysql
   echo Deleting MariaDB...                                               =
   d:\Server\bin\mariadb\bin\mysqld --remove
   echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   echo If no errors, all is OK
   pause
   goto start
   )
 
IF "%ACTIONLEVEL%"=="51" (
   CLS
   echo KrakeN Server %ver%
   echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   echo Starting ApacheMonitor...                                         =
   start d:\Server\bin\Apache24\bin\ApacheMonitor.exe
   echo ApacheMonitor is working!                                         =
   echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   echo If no errors, all is OK
   pause
   goto start
   )
 
   IF "%ACTIONLEVEL%"=="61" (
   CLS
   echo KrakeN Server %ver%
   echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   echo Listening port 80...                                              =
   for /f "tokens=1,2,3,4,5*" %%i in ('netstat -aon ^| findstr ":80" ^| findstr /i listening') do echo %%j %%l & @tasklist | findstr %%m
   echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   echo If no errors, all is OK
   pause
   goto start
   )
 
   IF "%ACTIONLEVEL%"=="71" (
   CLS
   echo KrakeN Server %ver%
   echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   echo Opening localhost...                                              =
   start localhost
   echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   echo If no errors, all is OK
   goto start
   )
 
   IF "%ACTIONLEVEL%"=="72" (
   CLS
   echo KrakeN Server %ver%
   echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   echo Opening Server Files Directory...                                 =
   start d:\Server\data\htdocs\
   echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   echo If no errors, all is OK
   goto start
   )

echo ERROR, now closing
PAUSE
EXIT