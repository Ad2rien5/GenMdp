function get_regex {
    param (
        [bool]$uppercase,
        [bool]$number,
        [bool]$special_char
    )
    
    if ($uppercase -and $number -and $special_char) {
        return "^[a-zA-Z0-9\W_]+$"
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
    $regex = get_regex $uppercase $number $special_char
    $nb = $size - ($uppercase, $number, $special_char | Where-Object { $_ -eq $true }).Count
    $characters = $regex.Matches("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!#$%&*-:;<=>?_")
    $password = Get-Random -Count $nb -InputObject $characters

    if ($uppercase) {
        $rd_char = Get-Random -InputObject "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        $rd_pos = Get-Random -Maximum $nb
        $password = $password.Insert($rd_pos, $rd_char)
        $nb++
    }
    if ($number) {
        $rd_char = Get-Random -InputObject "0123456789"
        $rd_pos = Get-Random -Maximum $nb
        $password = $password.Insert($rd_pos, $rd_char)
        $nb++
    }
    if ($special_char) {
        $rd_char = Get-Random -InputObject "!#$%&*-:;<=>?_"
        $rd_pos = Get-Random -Maximum $nb
        $password = $password.Insert($rd_pos, $rd_char)
    }

    Write-Host $password
    return $password
}