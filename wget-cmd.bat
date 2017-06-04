@echo off
set /p URL=Enter URL (without http://):
set /p DNAME=Enter subdirectory:

set RESDIR=%CD%\%DNAME%\
if not exist %RESDIR% (
  mkdir %RESDIR%
)

if "%URL%"=="" goto error
wget64.exe -r --level=5 -k -np -p -nv -nH -E -t 4 -N -c http://%URL% -P %RESDIR%
goto end
:error
echo No site specified!
:end
pause