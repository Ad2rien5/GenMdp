@echo off
goto Password

:: Function
: IsBool
if "%test%"=="y" (
    set bool=true
    goto %next%
) else if /i "%test%"=="n" (
    set bool=false
    goto %next%

) else (
    echo Your input is not a valid answer, try again.
    echo %test%
    goto %actual%
)

:: Size of the password
: Password
set /p "nombre=Which size should be this new password : "

for /f "delims=0123456789" %%a in ("%nombre%") do (
    echo Your input is not a valid number, try again.
    goto Password
)

:: Specification of the new password
: Uppercase
set actual=Uppercase
set next=Number

set /p "test=Are uppercase allowed?(y/n) "
goto IsBool

: Number
set uppercase=%bool%
set actual=Number
set next=SpecialChar

set /p "test=Are number allowed?(y/n) "
goto IsBool

: SpecialChar
set number=%bool%
set actual=SpecialChar
set next=END

set /p "test=Are special character allowed?(y/n) "
goto IsBool

:: End of File
: END
pause