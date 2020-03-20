@ECHO OFF
SETLOCAL EnableDelayedExpansion

rem este script define apenas a variavel wait

set wait=0

:: comando para desligar
:: verifica o parametro para ajustar o tempo
set parametros=%*
if [%parametros%]==[] (
	set parametros=%wait%
)
set parametros=%parametros:h=*3600+%
set parametros=%parametros:m=*60+%
set parametros=%parametros:s=*1+%
set parametros=%parametros: =+%
if [%parametros:~-1%]==[+] (
	set parametros=%parametros%0
)
if [%parametros%]==[now] (
	set parametros=0
)
set /a wait=%parametros%

if [%errorlevel%] NEQ [0] (
	rem houve erro
	goto:eof
)

timeout /t %wait% /nobreak