function show_battery_percent -d 'Show current battery with percentage'
    echo (cat /sys/class/power_supply/BAT1/capacity)%
end
