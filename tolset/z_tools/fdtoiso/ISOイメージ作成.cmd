@echo off

rem ボリュームラベル
SET VOLUMELABEL=BOOTDISC

for %%i in (cygwin1.dll mkisofs.exe savedlg.exe) do if not exist %%i (
	echo %%i が見つかりません！
	goto _end)

if %1'==' (
	echo フロッピーイメージファイルをドラッグ＆ドロップしてください。
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
	echo m9（´Д｀）それはフロッピーイメージじゃないですよ！
	del "%ISOFILENAME%"
	goto _end)
echo.
echo （・∀・）ISOイメージの作成が完了しました！

:_end
pause
