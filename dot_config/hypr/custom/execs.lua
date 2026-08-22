hl.on("hyprland.start", function ()
    hl.exec_cmd("fcitx5 --replace -d")
    hl.exec_cmd("clash-verge")
    hl.exec_cmd("/home/gujiu/miniconda3/bin/python /home/gujiu/Project/Python/campus_login.py")
end)

hl.on("hyprland.start", function()
    -- 启动后强制聚焦到 1 号工作区（即 DP-2）
    hl.exec_cmd("hyprctl dispatch workspace 1")
end)
