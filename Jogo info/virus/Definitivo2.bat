@echo off
set /a counter=0
set /a max_time=10
set "base_dir=C:\PastaTemp"  :: Define um diretório base para armazenar as pastas

:: Verifica se o diretório base existe, se não, cria
if not exist "%base_dir%" mkdir "%base_dir%"

:loop
if %counter% geq %max_time% goto end

:: Cria uma pasta com nome único usando %random%
set "folder_name=%base_dir%\pasta_%random%"
md "%folder_name%"
start "%folder_name%"

:: Abre e fecha o CMD aleatoriamente
set /a rand=%random% %% 2
if %rand%==0 start cmd /c exit

timeout /t 1 >nul
set /a counter+=1
goto loop

:end
echo "10 segundos se passaram."