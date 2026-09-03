# 禁用 Fish 欢迎语
if status is-interactive
    set fish_greeting
end

# Yazi
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# 设置 eza 作为 ls 的替代
alias ls 'eza --icons --group-directories-first'
alias ll "eza -lh --icons --group-directories-first"
alias la "eza -lha --group-directories-first"
alias lt "eza --tree --icons"

# 设置 clear 命令清屏
alias clear "printf '\033[2J\033[3J\033[1;1H'"

# 设置 fastfetch
if status is-interactive
    fastfetch
end

# 设置 zoxide
zoxide init fish | source

# 设置 starship
starship init fish | source

# 设置 baidunetdisk启动方法
function baidunetdisk
    /usr/lib/baidunetdisk/baidunetdisk --disable-gpu --no-sandbox --disable-software-rasterizer
end

# 设置 SSH 密钥
if status is-interactive
    keychain --eval --quiet id_ed25519 | source
end
