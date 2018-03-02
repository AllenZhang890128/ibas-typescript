@echo off
setlocal EnableDelayedExpansion
echo ***************************************************************************
echo                developing.bat
echo                     by niuren.zhu
echo                           2017.11.06
echo  ˵����
echo     1. �˽ű���Ҫ��Node.js command prompt�����С�
echo     2. ����������ibasĿ¼�ļ���
echo     3. ����������openui5\typingsĿ¼�ļ���
echo     4. ����������test\appsĿ¼�ļ���
echo     5. ����web����
echo ****************************************************************************
REM ���ò�������
REM ����Ŀ¼
SET STARTUP_FOLDER=%~dp0
REM ����Ĺ���Ŀ¼
SET WORK_FOLDER=%~1
REM �ж��Ƿ񴫹���Ŀ¼��û����������Ŀ¼
if "%WORK_FOLDER%"=="" SET WORK_FOLDER=%STARTUP_FOLDER%
REM ������Ŀ¼����ַ����ǡ�\������
if "%WORK_FOLDER:~-1%" neq "\" SET WORK_FOLDER=%WORK_FOLDER%\
echo --������Ŀ¼��%WORK_FOLDER%
REM �����ļ��м���
CALL :WATCHING_TS "%WORK_FOLDER%ibas\tsconfig.json"
CALL :WATCHING_TS "%WORK_FOLDER%openui5\tsconfig.json"
CALL :WATCHING_TS "%WORK_FOLDER%test\basic\tsconfig.json"

REM ����web����
REM ��������IIS
SET WEB_SERVER="%ProgramFiles%\IIS Express\iisexpress.exe"
SET WEB_PORT=15386
IF EXIST %WEB_SERVER% (
  echo ----WEB����%WEB_SERVER%
  START /min CALL %WEB_SERVER% /path:%WORK_FOLDER% /port:%WEB_PORT%
  GOTO :EOF
) ELSE (
REM ������IIS������������Ŀ¼tomcat
  SET WEB_SERVER="%WORK_FOLDER%tomcat\bin\startup.bat"
  IF EXIST %WEB_SERVER% (
    echo ----WEB����%WEB_SERVER%
    CALL %WEB_SERVER%
    GOTO :EOF
  )
)
echo ������web����������iis��tomcat��
GOTO :EOF
:WATCHING_TS
SET CONFIG_FILE=%1
echo ----����: %CONFIG_FILE%
IF EXIST %CONFIG_FILE% START /min tsc -w -p %CONFIG_FILE%
GOTO :EOF
