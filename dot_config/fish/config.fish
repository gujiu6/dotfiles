function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting
end

fish_vi_key_bindings
function fish_user_key_bindings
    # 在 insert 模式下绑定 'jk' 到 escape
    bind -M insert jj "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char force-repaint; end"
    # 在可视模式下，使用 y 复制到系统剪贴板
    bind -M visual y 'fish_clipboard_copy; commandline -f end-selection'

    # 在正常模式下，使用 p 从系统剪贴板粘贴
    bind -M default p fish_clipboard_paste
end

starship init fish | source
if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
    cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
end

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

alias pamcan pacman
alias ls 'eza --icons --group-directories-first'
alias ll "eza -lh --icons --group-directories-first"
alias la "eza -lha --group-directories-first"
alias lt "eza --tree --icons"
alias clear "printf '\033[2J\033[3J\033[1;1H'"
alias q 'qs -c ii'
zoxide init fish | source
starship init fish | source

function live
    set -l old_pwd $PWD
    cd ~/Work/Github/Bilibili && ./Live $argv
    cd $old_pwd 2>/dev/null
end
# function fish_prompt
#   set_color cyan; echo (pwd)
#   set_color green; echo '> '
# end

# 仅在 tty1 自动启动 Hyprland
if test -z "$WAYLAND_DISPLAY"; and test (tty) = /dev/tty1
    exec start-hyprland
end
set -gx JAVA_HOME /usr/lib/jvm/java-21-openjdk
set -gx PATH $JAVA_HOME/bin $PATH
set -Ux _NT_SYMBOL_PATH "srv*/home/gujiu/symbols*https://msdl.microsoft.com/download/symbols"
function wineexe
    set -x WINEDEBUG -all
    wine $argv
end

function baidunetdisk
    /usr/lib/baidunetdisk/baidunetdisk --disable-gpu --no-sandbox --disable-software-rasterizer
end
set -x LIBVIRT_DEFAULT_URI qemu:///system

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/gujiu/miniconda3/bin/conda
    eval /home/gujiu/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/gujiu/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/gujiu/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/gujiu/miniconda3/bin" $PATH
    end
end

#操作手机
alias scrcpy='scrcpy --video-bit-rate 8M --max-fps 60 --crop 1080:2400:0:0'

if status is-interactive
    keychain --eval --quiet id_ed25519 | source
end
