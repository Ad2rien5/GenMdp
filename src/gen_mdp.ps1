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