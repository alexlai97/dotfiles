function show_memory_percent -d 'Show current memory usage with percentage'
    echo (free | awk '/Mem/ {printf "%d\n", $3 * 100 / $2}')%
end

