RMDIR /S /Q %~dp0..\dist
mkdir %~dp0..\dist
robocopy %~dp0..\src\hook %~dp0..\dist\hook /s /e
robocopy %~dp0..\src\lib %~dp0..\dist\lib /s /e
robocopy %~dp0..\src\sounds %~dp0..\dist\sounds /s /e

copy ..\src\icon.png ..\dist\icon.png
copy ..\src\mod_info.lua ..\dist\mod_info.lua
copy ..\README.md ..\dist\README.md

cd ..\dist
tar.exe -cf movingonup-3.zip icon.png mod_info.lua README.md sounds\upBank.xwb sounds\upSoundBank.xsb lib\AsciiMessages.lua lib\TextPrinter.lua hook\lua\ui\game\chat.lua hook\lua\ui\game\textdisplay.lua
