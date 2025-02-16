@echo off
set /a counter=0
set /a max_time=10
set "base_dir=C:\PastaTemp"  :: Diretório base para armazenar as pastas

:: Verifica se o diretório base existe, se não, cria
if not exist "%base_dir%" mkdir "%base_dir%"

:loop
if %counter% geq %max_time% goto end

:: Cria uma pasta com nome único usando %random%
set "folder_name=%base_dir%\pasta_%random%"
md "%folder_name%"

:: Abre a pasta no explorador de arquivos
start explorer "%folder_name%"

:: Abre e fecha o CMD aleatoriamente
set /a rand=%random% %% 2
if %rand%==0 start cmd /c exit

:: Exibe a mensagem assustadora a cada 0.5 segundos
echo "Você está sendo observado..."
timeout /t 0.5 >nul

:: Aguarda 1 segundo antes de continuar
timeout /t 1 >nul

set /a counter+=1
goto loop

:end
echo "10 segundos se passaram."
pause