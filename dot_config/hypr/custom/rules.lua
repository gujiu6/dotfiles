hl.window_rule({match = {class = "^()$", title = "^()$" },                   no_blur = true })
hl.window_rule({match = {class = ".*" },                                     no_blur = true })

-- ######## Opacity Rules ########

-- 浏览器
hl.window_rule({match = {class = "^(firefox)$" },                            opacity = "0.9 0.8" })
hl.window_rule({match = {class = "^(Brave-browser)$" },                      opacity = "0.9 0.8" })
hl.window_rule({match = {class = "^(zen)$" },                                opacity = "0.9 0.85" })

-- -- 编辑器 (VSCode 系列)
-- hl.window_rule({match = {class = "^(code-oss)$" },                           opacity = "0.90 0.9" })
-- hl.window_rule({match = {class = "^([Cc]ode)$" },                            opacity = "0.90 0.9" })
-- hl.window_rule({match = {class = "^([Cc]ode-url-handler)$" },                   opacity = "0.85 0.80" })
-- hl.window_rule({match = { class = "^([Cc]ode-[Ii]nsiders)$" }, opacity = "0.95 0.9" })

-- 编辑器 (Zed 系列)
hl.window_rule({match = {class = "^(.*[Zz]ed.*)$" },                            opacity = "0.88 0.9" })

-- 终端
hl.window_rule({match = {class = "^(kitty)$" },                              opacity = "0.9 0.8" })

-- 文件管理
hl.window_rule({match = {class = "^(org.kde.dolphin)$" },                    opacity = "0.9 0.8" })
hl.window_rule({match = {class = "^(org.kde.ark)$" },                        opacity = "0.9 0.8" })

-- 系统外观与设置
hl.window_rule({match = {class = "^(nwg-look)$" },                           opacity = "0.9 0.8" })
hl.window_rule({match = {class = "^(qt5ct)$" },                              opacity = "0.9 0.8" })
hl.window_rule({match = {class = "^(qt6ct)$" },                              opacity = "0.9 0.8" })
hl.window_rule({match = {class = "^(kvantummanager)$" },                     opacity = "0.9 0.8" })

-- 硬件与连接管理
hl.window_rule({match = {class = "^(org.pulseaudio.pavucontrol)$" },          opacity = "0.9 0.8" })
hl.window_rule({match = {class = "^(blueman-manager)$" },                    opacity = "0.9 0.8" })
hl.window_rule({match = {class = "^(nm-applet)$" },                          opacity = "0.9 0.8" })
hl.window_rule({match = {class = "^(nm-connection-editor)$" },               opacity = "0.9 0.8" })

-- 权限认证
hl.window_rule({match = {class = "^(org.kde.polkit-kde-authentication-agent-1)$" }, opacity = "0.9 0.8" })
hl.window_rule({match = {class = "^(polkit-gnome-authentication-agent-1)$" }, opacity = "0.9 0.8" })

-- 社交与协作
hl.window_rule({match = {class = "^(vesktop)$" },                            opacity = "0.9 0.8" })
hl.window_rule({match = {class = "^(discord)$" },                            opacity = "0.9 0.8" })
hl.window_rule({match = {class = "^(WebCord)$" },                             opacity = "0.9 0.8" })
hl.window_rule({match = {class = "^(ArmCord)$" },                             opacity = "0.9 0.8" })
hl.window_rule({match = {class = "^(Signal)$" },                             opacity = "0.9 0.8" })

-- 游戏与媒体
hl.window_rule({match = {class = "^([Ss]team)$" },                            opacity = "0.9 0.8" })
hl.window_rule({match = {class = "^(steamwebhelper)$" },                      opacity = "0.9 0.8" })
hl.window_rule({match = {class = "^([Ss]potify)$" },                           opacity = "0.9 0.8" })

-- 其他常用应用
hl.window_rule({match = {class = "^(com.github.rafostar.Clapper)$" },         opacity = "0.9 0.8" })
hl.window_rule({match = {class = "^(com.github.tchx84.Flatseal)$" },          opacity = "0.9 0.8" })
hl.window_rule({match = {class = "^(com.obsproject.Studio)$" },               opacity = "0.9 0.8" })
hl.window_rule({match = {class = "^(gnome-boxes)$" },                         opacity = "0.9 0.8" })
hl.window_rule({match = {class = "^(app.drey.Warp)$" },                       opacity = "0.9 0.8" })
hl.window_rule({match = {class = "^(io.missioncenter.MissionCenter)$" },      opacity = "0.9 0.8" })
