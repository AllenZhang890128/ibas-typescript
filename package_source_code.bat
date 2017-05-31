@echo off
echo ***************************************************************************
echo      package_source_code.bat
echo                     by niuren.zhu
echo                           2017.01.19
echo  ˵����
echo     1. ��װ7zip�����ص�ַhttp://www.7-zip.org/��
echo     2. ���7zip��ϵͳ����PATH��������7z -h����Ƿ�������
echo     3. �ű�������ǰĿ¼Դ�뵽out/SourceCode.zip��
echo ****************************************************************************
REM ���ò�������
SET WORK_FOLDER=%~dp0
SET RELEASE_FOLDER=%WORK_FOLDER%release\
SET PACKAGE_TYPE=zip
SET FILE_NAME=SourceCode.%PACKAGE_TYPE%

echo --��ǰ������Ŀ¼��[%WORK_FOLDER%]
if not exist "%RELEASE_FOLDER%" mkdir "%RELEASE_FOLDER%"
if exist "%RELEASE_FOLDER%%FILE_NAME%" del /q "%RELEASE_FOLDER%%FILE_NAME%"

7z a -t%PACKAGE_TYPE% "%RELEASE_FOLDER%%FILE_NAME%" * -x!*.%PACKAGE_TYPE% -xr!out -xr!release -xr!target -xr!.git -xr!.settings -xr!tomcat -xr!.vs* -xr!*.config -xr!*.publishproj

if exist "%RELEASE_FOLDER%%FILE_NAME%" (
  echo --����ɹ�
) else (
  echo --���ʧ��
)
