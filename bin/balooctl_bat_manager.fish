#!/usr/bin/fish

# To Setup:
#  - In KDE Power managment settings, set this script to run every power level on profile load
#  - In crontabs, every 5 minutes or so, like this:
#     - "*/5 * * * * /home/{User Here}}/Documents/projects/fish-scripts/bin/50_balooctl_bat_manager.fish"

set state (acpi | awk -F '1: ' '{print $2}' | awk -F ',' '{print $1}' | xargs)
if [ $state = "Discharging" ] 
    balooctl disable > /dev/null 2>&1
else
    balooctl enable > /dev/null 2>&1
end