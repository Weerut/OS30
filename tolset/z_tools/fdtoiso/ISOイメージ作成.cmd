@echo off

rem �{�����[�����x��
SET VOLUMELABEL=BOOTDISC

for %%i in (cygwin1.dll mkisofs.exe savedlg.exe) do if not exist %%i (
	echo %%i ��������܂���I
	goto _end)

if %1'==' (
	echo �t���b�s�[�C���[�W�t�@�C�����h���b�O���h���b�v���Ă��������B
	goto _end)

if exist *.tmp del *.tmp
if exist .\temp_dir rmdir .\temp_dir /s /q

savedlg.exe
set /p ISOFILENAME=<filename.tmp
if "%ISOFILENAME%"=="" goto _end
del filename.tmp

mkdir .\temp_dir
copy /v %1 .\temp_dir\boot.img

mkisofs -iso-level 1 -J -hide-joliet-trans-tbl -joliet-long -b "boot.img" -o "%ISOFILENAME%" ".\temp_dir"
rmdir .\temp_dir /s /q
if errorlevel 1 (
	cls
	echo m9�i�L�D�M�j����̓t���b�s�[�C���[�W����Ȃ��ł���I
	del "%ISOFILENAME%"
	goto _end)
echo.
echo �i�E�́E�jISO�C���[�W�̍쐬���������܂����I

:_end
pause
