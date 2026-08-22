-- Environment variables --
require("hyprland/env")
require("custom/env")

-- Defaults --
require("hyprland/execs")
require("hyprland/general")
require("hyprland/rules")
require("hyprland/colors")
require("hyprland/keybinds")

-- Custom --
require("custom/execs")
require("custom/general")
require("custom/rules")
require("custom/keybinds")

-- Shell overrides --
require("hyprland/shellOverrides/main")

-- OS Setting --
require("monitors")
require("workspaces")


hl.config({
    general = {
        gaps_in = 0,
        gaps_out = 0
    },
})
hl.device({
    name = "uniw0001:00-093a:0255-touchpad",
    enabled = false
})
