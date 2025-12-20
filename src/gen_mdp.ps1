function get_regex {
    param (
        [bool]$uppercase = $false,
        [bool]$number = $false,
        [bool]$special_char = $false
    )
    
    if ($uppercase -and $number -and $special_char) {
        return "[a-zA-Z0-9\W_]"
    }

    $regex = "[a-z"

    if ($uppercase) {
        $regex += "A-Z"
    }

    if ($number) {
        $regex += "0-9"
    }

    if ($special_char) {
        $regex += "^a-zA-Z0-9"
    }

    $regex += "]"
    return $regex
}

function get_mdp {
    param (
        [int]$size,
        [bool]$uppercase,
        [bool]$number,
        [bool]$special_char
    )
    $regex = get_regex -uppercase $uppercase -number $number -special_char $special_char
    $nb = $size - ($uppercase, $number, $special_char | Where-Object { $_ -eq $true }).Count
    $characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!#$%&*-:;<=>?_" -replace "[^$regex]", "" 
    $password = -join ($characters.ToCharArray() | Get-SecureRandom -Count $nb)

    if ($uppercase) {
        $rd_char = Get-SecureRandom -InputObject "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        $rd_pos = Get-SecureRandom -Maximum $nb
        $password = $password.Insert($rd_pos, $rd_char)
        $nb++
    }
    if ($number) {
        $rd_char = Get-SecureRandom -InputObject "0123456789"
        $rd_pos = Get-SecureRandom -Maximum $nb
        $password = $password.Insert($rd_pos, $rd_char)
        $nb++
    }
    if ($special_char) {
        $rd_char = Get-SecureRandom -InputObject "!#$%&*-:;<=>?_"
        $rd_pos = Get-SecureRandom -Maximum $nb
        $password = $password.Insert($rd_pos, $rd_char)
    }

    Write-Host $password
    return $password
}