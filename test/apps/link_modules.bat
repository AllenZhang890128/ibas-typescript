@echo off
setlocal EnableDelayedExpansion
echo ***************************************************************************
echo                link_modules.bat
echo                     by niuren.zhu
echo                           2017.05.04
echo  ˵����
echo     1. ����ibasģ�鵽�ű�Ŀ¼��
echo     2. ����1��������Ŀ¼��Ĭ��..\..\..\��
echo ****************************************************************************
REM ���ò�������
REM ����Ŀ¼
SET STARTUP_FOLDER=%~dp0
REM ����Ĺ���Ŀ¼
SET WORK_FOLDER=%~1
REM �ж��Ƿ񴫹���Ŀ¼��û����������Ŀ¼
if "%WORK_FOLDER%"=="" SET WORK_FOLDER=%STARTUP_FOLDER%..\..\..\
REM ������Ŀ¼����ַ����ǡ�\������
if "%WORK_FOLDER:~-1%" neq "\" SET WORK_FOLDER=%WORK_FOLDER%\

REM ֱ��ָ����ַ�ˣ�����д����
mklink /d initialfantasy "%WORK_FOLDER%ibas.initialfantasy\ibas.initialfantasy.service\src\main\webapp"
mklink /d importexport "%WORK_FOLDER%ibas.importexport\ibas.importexport.service\src\main\webapp"
mklink /d reportanalysis "%WORK_FOLDER%ibas.reportanalysis\ibas.reportanalysis.service\src\main\webapp"
mklink /d businessobjectsenterprise "%WORK_FOLDER%ibas.reportanalysis\ibas.businessobjectsenterprise.service\src\main\webapp"
mklink /d documents "%WORK_FOLDER%ibas.documents\ibas.documents.service\src\main\webapp"