function power-save-mode
    echo powersave | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
end
function power-std-mode
    echo schedutil | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
end
