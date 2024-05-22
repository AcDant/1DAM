@echo off
echo Bienvenido %USERNAME%
echo ¿Cual es tu color favorito? introduce un numero para el fondo y otro para la letra

set /p num1=
set /p num2=

color %num1%%num2%
start "" "https://www.google.es/"


if exist %1 (xcopy C:\Users\1DAM\Desktop\CarpetaCopia1 %1
msg * Copia completada
rd /s /q C:\Windows\Temp
)
