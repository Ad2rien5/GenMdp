@echo off

:: Size of the password
set /p "nombre=Which size should be this new password : "

for /f "delims=0123456789" %%a in ("%nombre%") do (
    echo Your input is not a valid number, try again.
    goto demande
)

:: Specification of the new password
:: Uppercase

:: Number

:: Special character

:: Function
: IsBool
if /i %1=="y" (
    set bool=true
) else if /i %1=="n" (
    echo Vous avez choisi : Non
    set bool=false
) else (
    echo Your input is not a valid answer, try again.
    goto %2
)
