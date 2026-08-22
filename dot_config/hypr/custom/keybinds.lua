-- 基础设置与 Shell 配置
hl.bind("CTRL + SUPER + Slash", hl.dsp.exec_cmd("xdg-open ~/.config/illogical-impulse/config.json"), {description = "Edit shell config"})
hl.bind("CTRL + SUPER + ALT + Slash", hl.dsp.exec_cmd("xdg-open ~/.config/hypr/custom/keybinds.lua"), {description = "Edit extra keybinds"})

-- QuickShell 搜索切换
hl.bind("SUPER + R", hl.dsp.global("quickshell:searchToggle"), {description = "Toggle search"})
hl.bind("SUPER + Tab", hl.dsp.global("quickshell:searchToggle"))

-- Vim 风格聚焦 (HJKL)
hl.bind("SUPER + H", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "r" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "d" }))

-- Vim 风格移动窗口 (HJKL)
hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "d" }))

-- 窗口基础控制
hl.bind("SUPER + C", hl.dsp.window.close(), {description = "Close"})
hl.bind("SUPER + SHIFT + ALT + C", hl.dsp.exec_cmd("hyprctl kill"), {description = "Forcefully zap a window"})
hl.bind("SUPER + F", hl.dsp.window.float("toggle"), {description = "Float/Tile"})
hl.bind("SUPER + M", hl.dsp.window.fullscreen(0), {description = "Fullscreen"})

-- ##################################################################
-- 使用 hl.dispatch 强制重写：直接调用 Hyprland 原生指令名
-- ##################################################################

-- 发送到 Special 工作区 (Scratchpad)
hl.bind("SUPER + SHIFT + P", function() 
    hl.dispatch("movetoworkspacesilent", "special") 
end, {description = "Send to scratchpad"})

-- 切换 Special 工作区
hl.bind("SUPER + P", function() 
    hl.dispatch("togglespecialworkspace", "") 
end, {description = "Toggle scratchpad"})

-- ##################################################################

-- 会话控制
hl.bind("SUPER + ALT + L", hl.dsp.exec_cmd("loginctl lock-session"), {description = "Lock"})
hl.bind("SUPER + CTRL + ALT + L", hl.dsp.exec_cmd("systemctl suspend || loginctl suspend"), {locked = true, description = "Sleep"})

-- 终端启动
hl.bind("SUPER + Q", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/launch_first_available.sh \"${TERMINAL}\" \"kitty -1\""))

-- 窗口大小调整
hl.bind("CTRL + SUPER + L", hl.dsp.window.resize({x = 30, y = 0}), {repeating = true})
hl.bind("CTRL + SUPER + H", hl.dsp.window.resize({x = -30, y = 0}), {repeating = true})
hl.bind("CTRL + SUPER + K", hl.dsp.window.resize({x = 0, y = -30}), {repeating = true})
hl.bind("CTRL + SUPER + J", hl.dsp.window.resize({x = 0, y = 30}), {repeating = true})
