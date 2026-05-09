starship init fish | source

alias waybar-reload="killall waybar; waybar & disown"
function fish_greeting
    set_color yellow
    echo "  居酒屋  //  IZAKAYA TERMINAL"
    echo "  ─────────────────────────────"
    set_color normal
    fastfetch
end

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
