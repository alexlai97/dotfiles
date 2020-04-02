function show_cpu_percent -d 'Show current cpu usage with percentage'
    read cpu a b c previdle rest < /proc/stat
    set -l prevtotal (math $a+$b+$c+$previdle)
    sleep 0.5
    read cpu a b c idle rest < /proc/stat
    set -l total (math $a+$b+$c+$idle)
    set -l result (math "100*( ($total-$prevtotal) - ($idle-$previdle)  ) / ($total-$prevtotal)")
    echo $result%
end
