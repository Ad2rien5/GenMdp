@echo off

:: Function
: IsBool
if /i %test=="y" (
    set bool=true
) else if /i %test=="n" (
    set bool=false
    goto %

) else (
    echo Your input is not a valid answer, try again.
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

: Number
set actual=Number
set next=SpecialChar

: SpecialChar
set actual=SpecialChar
set next=END

:: END
: END
