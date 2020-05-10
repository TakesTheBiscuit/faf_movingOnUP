RMDIR /S /Q %~dp0dist
mkdir %~dp0dist
robocopy %~dp0hook %~dp0dist\hook /s /e
robocopy %~dp0lib %~dp0dist\lib /s /e
robocopy %~dp0sounds %~dp0dist\sounds /s /e
copy icon.png dist\icon.png
copy mod_info.lua dist\mod_info.lua
copy README.md dist\README.md
