function notify
    printf "Starting Command\n"
    set start_time (date +%s)
    $argv
    set total_time (math (date +%s) - $start_time)
    notify-send -u normal -a Notify "Command $argv has finished in $total_time seconds"
    printf "Command Finished in $total_time\n"
end