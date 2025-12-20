function test_case {
    param (
        [int]$size,
        [bool]$uppercase = $false,
        [bool]$number = $false,
        [bool]$special_char = $false
    )
    $test = get_mdp -size $size -uppercase $uppercase -number $number -special_char $special_char
    
    if (-not $test.Length -eq $size) {
        Write-Host ("[Test failed] Wrong size : {0} expecting {1}`n" -f $test.Length, $size)
        return $false
    }

    if ($uppercase -and -not ($test -match "[A-Z]")) {
        Write-Host ("[Test failed] Uppercase missing: {0}`n" -f $test)
        return $false
    }

    if ($number -and -not ($test -match "[0-9]")) {
        Write-Host ("[Test failed] Number missing: {0}`n" -f $test)
        return $false
    }

    if ($special_char -and -not ($test -match "[^a-zA-Z0-9]")) {
        Write-Host ("[Test failed] Special character missing: {0}`n" -f $test)
        return $false
    }

    Write-Host "Test succeed`n"
    return $true
}

function main {
    $count = 0
    
    # case None
    Write-Host "| 'None' test case |"
    $size = Get-Random -Minimum 5 -Maximum 20
    if (test_case -size $size) {
        $count++
    }
    
    # case upper
    Write-Host "| 'Upper' test case |"
    $size = Get-Random -Minimum 5 -Maximum 20
    if (test_case -size $size -uppercase $true) {
        $count++
    }

    # case number
    Write-Host "| 'Number' test case |"
    $size = Get-Random -Minimum 5 -Maximum 20
    if (test_case -size $size -number $true) {
        $count++
    }

    # case special char
    Write-Host "| 'Special Character' test case |"
    $size = Get-Random -Minimum 5 -Maximum 20
    if (test_case -size $size -special_char $true) {
        $count++
    }

    # case upper + number
    Write-Host "| 'Upper + Number' test case |"
    $size = Get-Random -Minimum 5 -Maximum 20
    if (test_case -size $size -uppercase $true -number $true) {
        $count++
    }

    # case number + special char
    Write-Host "| 'Number + Special Character' test case |"
    $size = Get-Random -Minimum 5 -Maximum 20
    if (test_case -size $size -number $true -special_char $true) {
        $count++
    }

    # case upper + special char
    Write-Host "| 'Upper + Special Character' test case |"
    $size = Get-Random -Minimum 5 -Maximum 20
    if (test_case -size $size -uppercase $true -special_char $true) {
        $count++
    }

    # case all
    Write-Host "| 'All' test case |"
    $size = Get-Random -Minimum 5 -Maximum 20
    if (test_case -size $size -uppercase $true -number $true -special_char $true) {
        $count++
    }

    Write-Output "Test finished successfully"
    Write-Output $count "out of 8 were successfull"
}

$sourcePath = Join-Path $PSScriptRoot "..\src\gen_mdp.ps1"
. $sourcePath
main