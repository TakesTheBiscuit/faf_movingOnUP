
SET DEST=C:\Users\%USERNAME%
SET DEST3="\Documents\My Games\Gas Powered Games\Supreme Commander Forged Alliance\Mods\faf_movingOnUP_dev"
RMDIR /S /Q %DEST%%DEST3%
mkdir %DEST%%DEST3%
copy %~dp0..\dist\movingonup-3.zip %DEST%%DEST3%
cd %DEST%%DEST3%
tar.exe -xf movingonup-3.zip
del movingonup-3.zip