hl.config({
    input = {
        kb_layout = "us",
        numlock_by_default = true,
        repeat_delay = 250,
        repeat_rate = 35,
        follow_mouse = 1,
        off_window_axis_events = 2,
        sensitivity = 1.0,
        accel_profile = "flat",
        touchpad = {
            natural_scroll = true, -- Lua 中使用 true 对应 yes
            disable_while_typing = true,
            clickfinger_behavior = true,
            scroll_factor = 0.5
        }
    }
})
