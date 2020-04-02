function fish_greeting -d 'Print greetings (when login)'
    switch (tty)
        case /dev/tty(seq 1 6)
            echo Hello (whoami), (hostname) battery (show_battery_percent), cpu (show_cpu_percent), memory (show_memory_percent)
            fortune -c | cowthink -f (find /usr/share/cows -type f | shuf -n 1)
        case '*'
            # no greeting
    end
end
