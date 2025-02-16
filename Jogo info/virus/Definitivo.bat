@echo off
set /a counter=0
set /a max_time=10

:loop
if %counter% geq %max_time% goto end

md C:\pasta_%random%
start C:\pasta_%random%

:: Abre e fecha o CMD aleatoriamente
set /a rand=%random% %% 2
if %rand%==0 start cmd /c exit

timeout /t 1 >nul
set /a counter+=1
goto loop

:end
echo "10 segundos se passaram."