@echo off
setlocal EnableDelayedExpansion
echo ***************************************************************************
echo                build_all.bat
echo                     by niuren.zhu
echo                           2017.01.13
echo  ˵����
echo     1. �˽ű���Ҫ��Node.js command prompt�����С�
echo     2. ������ǰĿ¼��������Ŀ¼������tsconfig.json����롣
echo ****************************************************************************
REM ���ò�������
REM ����Ŀ¼
SET STARTUP_FOLDER=%~dp0
REM ����Ĺ���Ŀ¼
SET WORK_FOLDER=%~1
REM �ж��Ƿ񴫹���Ŀ¼��û����������Ŀ¼
if "%WORK_FOLDER%"=="" SET WORK_FOLDER=%STARTUP_FOLDER%
REM ������Ŀ¼����ַ����ǡ�\������
if "%WORK_FOLDER:~-0,1%" neq "\" SET WORK_FOLDER=%WORK_FOLDER%\

for /f %%l in ('dir /s /b "%WORK_FOLDER%tsconfig.json"') DO (
  echo --��ʼ���룺%%~dpl
REM �ı乤��Ŀ¼
  cd /d %%~dpl
  call tsc
)
REM ��������Ŀ¼
cd /d %STARTUP_FOLDER%