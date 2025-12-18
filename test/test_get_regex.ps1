function test_case {
    param (
        [string]$oracle,
        [bool]$uppercase,
        [bool]$number,
        [bool]$special_char
    )
    $test = get_regex -uppercase $uppercase -number $number -special_char $special_char
    $result = $oracle -eq $test
    return $result
}

function main {
    $count = 0
    
    # case None
    $oracle = "[a-z]"
    if (test_case -oracle $oracle) {
        Write-Host "'None' test case succed"
        $count++
    } else {
        Write-Host "'None' test case failed"
    }

    # case upper
    $oracle = "[a-zA-Z]"
    if (test_case -oracle $oracle -uppercase $true) {
        Write-Host "'Upper' test case succed"
        $count++
    } else {
        Write-Host "'Upper' test case failed"
    }

    # case number
    $oracle = "[a-z0-9]"
    if (test_case -oracle $oracle -number $true) {
        Write-Host "'Number' test case succed"
        $count++
    } else {
        Write-Host "'Number' test case failed"
    }

    # case special char
    $oracle = "[a-z^a-zA-Z0-9]"
    if (test_case -oracle $oracle -special_char $true) {
        Write-Host "'Special char' test case succed"
        $count++
    } else {
        Write-Host "'Special char' test case failed"
    }

    # case upper + number
    $oracle = "[a-zA-Z0-9]"
    if (test_case -oracle $oracle -uppercase $true -number $true) {
        Write-Host "'upper + number' test case succed"
        $count++
    } else {
        Write-Host "'upper + number' test case failed"
    }

    # case number + special char
    $oracle = "[a-z0-9^a-zA-Z0-9]"
    if (test_case -oracle $oracle -number $true -special_char $true) {
        Write-Host "'number + special char' test case succed"
        $count++
    } else {
        Write-Host "'number + special char' test case failed"
    }

    # case upper + special char
    $oracle = "[a-zA-Z^a-zA-Z0-9]"
    if (test_case -oracle $oracle -uppercase $true -special_char $true) {
        Write-Host "'Upper + Special char' test case succed"
        $count++
    } else {
        Write-Host "'Upper + Special char' test case failed"
    }

    # case all
    $oracle = "[a-zA-Z0-9\W_]"
    if (test_case -oracle $oracle -uppercase $true -number $true -special_char $true) {
        Write-Host "'All' test case succed"
        $count++
    } else {
        Write-Host "'All' test case failed"
    }

    Write-Output "Test finish successfully"
    Write-Output $count "out of 8 were successfull"
}

$sourcePath = Join-Path $PSScriptRoot "..\src\gen_mdp.ps1"
. $sourcePath
main