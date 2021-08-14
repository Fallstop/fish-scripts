function mass-rick
    printf "Connecting to host...\n"
    figlet -w (tput cols) -c (curl -sS http://mass-rickroll.host.qrl.nz/rick | sed -r 's/ /   /g')
    
end