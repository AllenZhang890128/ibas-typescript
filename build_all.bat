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
SET WORK_FOLDER=%~dp0

for /f %%l in ('dir /s /b "%WORK_FOLDER%tsconfig.json"') DO (
  echo --��ʼ���룺%%~dpl
REM �ı乤��Ŀ¼
  cd /d %%~dpl
  call tsc
)
REM ��������Ŀ¼
cd /d %WORK_FOLDER%