function detach
    $argv 1>/dev/null 2>/dev/null &; disown
end