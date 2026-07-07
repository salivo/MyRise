hl.config({
    input = {
        kb_layout = "us,cz",
        kb_variant = ",qwerty",
        kb_options = "grp:win_space_toggle",
        repeat_rate = 20,
        repeat_delay = 250,
        touchpad = {
            natural_scroll = true,
            clickfinger_behavior = true,
            scroll_factor = 0.4,
            -- disable_while_typing = false,
            -- drag_3fg = 1,
        },
    },
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
