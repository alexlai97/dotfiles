# Defined in /home/alex/.config/fish/functions/fish_title.fish @ line 2
function fish_title
    if [ $TERM = "eterm-color" ]
        # no nothing
    else
        echo $_ (pwd)
    end
end
