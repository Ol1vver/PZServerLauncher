@echo off
:setup
set "memmin=2048"
set "memmax=2048"
set "config=servertest"
set "params=-Dzomboid.steam=1"
set "title=Project Zomboid Server"
set "path=%CD%"
set "prevpath=%CD%"

title %title% - Setting up

set "settingsfile=%1"
if "%1"=="" set "settingsfile=%CD%\pzsv_config.ini"

echo Loading config file '%settingsfile%'
if exist %settingsfile% (
 call:readsettings
) else (
 echo Config file not found, skipping
)
echo.

title %title% - Setting up
echo Server parameters: '%params%'
echo Server config: '%config%'
echo Launcher config: '%settingsfile%'
echo Server memory:
echo   Minimum: '%memmin%'
echo   Maximum: '%memmax%'
echo.

setlocal enableextensions
set _JAVA_OPTIONS=
set PZ_CLASSPATH=istack-commons-runtime.jar;jassimp.jar;javacord-2.0.17-shaded.jar;javax.activation-api.jar;jaxb-api.jar;jaxb-runtime.jar;lwjgl.jar;lwjgl-natives-windows.jar;lwjgl-glfw.jar;lwjgl-glfw-natives-windows.jar;lwjgl-jemalloc.jar;lwjgl-jemalloc-natives-windows.jar;lwjgl-opengl.jar;lwjgl-opengl-natives-windows.jar;lwjgl_util.jar;sqlite-jdbc-3.27.2.1.jar;trove-3.0.3.jar;uncommons-maths-1.2.3.jar;./

if not exist %path% (
 color 0c
 title %title% - Error
 echo Server path not found. Is this the correct path?
 echo Specified path: '%CD%'
 echo.
 pause
 goto eof
)
cd /d %path%
if not exist jre64 (
 color 0c
 title %title% - Error
 echo Couldn't find the 'jre64' folder. Is this the correct path?
 echo Current path: '%CD%'
 echo.
 pause
 goto eof
)

echo Starting up!
echo.

:start
title %title% - Running

".\jre64\bin\java.exe" %params% -XX:+UseZGC -XX:-CreateCoredumpOnCrash -XX:-OmitStackTraceInFastThrow -Xms%memmin%m -Xmx%memmax%m -XX:+UseZGC -Djava.library.path=./natives/;./natives/win64/;./ -cp %PZ_CLASSPATH% zombie.network.GameServer -servername %config%

title %title% - Stopped
echo.
echo Server stopped. Press any key.
pause >nul
goto eof

:readsettings
for /f "delims=: tokens=1,2" %%G in (%settingsfile%) do set "%%G=%%H"
goto eof

:eof
cd %prevpath%
title %CD%