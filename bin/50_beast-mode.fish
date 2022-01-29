function beast-mode
    sudo tlp ac
    sudo auto-cpufreq --remove
    sudo systemctl stop auto-cpufreq.service
    sudo cpupower frequency-set -f 4000MHz
end

function beast-mode-off
    sudo tlp bat
    sudo cpupower frequency-set -f 1200MHz
end
