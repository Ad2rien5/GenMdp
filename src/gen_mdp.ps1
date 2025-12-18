function get_regex {
    param (
        [System.Boolean]$uppercase,
        [System.Boolean]$number,
        [System.Boolean]$special_char
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
        [regex]$regex
    )
    $characters = $regex.Matches("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!#$%&*-:;<=>?_")
    $password = Get-Random -Count $size -InputObject $characters

    # ajouter une vérification pour s'assurer qu'un caractère de chaque type est bien contenu dans le mot de passe final

    Write-Host $password
    return $password
}