hl.config({
    general = {
        gaps_in = 0,
        gaps_out = 0,
        border_size = 0,
        ["col.active_border"] = { colors = { "rgba(607b91aa)", "rgba(456775aa)" }, angle = 45 },
        ["col.inactive_border"] = { colors = { "rgba(404040aa)" } },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding = 0,
        active_opacity = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },

        blur = {
            enabled = true,
            size = 10,
            passes = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
    dwindle = {
        force_split                  = 0,
        preserve_split               = true,
        smart_split                  = false,
        smart_resizing               = true,
        permanent_direction_override = false,
        special_scale_factor         = 1,
        split_width_multiplier       = 1.0,
        use_active_for_splits        = true,
        default_split_ratio          = 1.0,
        split_bias                   = 0,
        precise_mouse_move           = false,
    },
    xwayland = {
        force_zero_scaling = true
    },
    misc = {
        disable_hyprland_logo = true
    }
})

-- Curves
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.curve("dys", { type = "bezier", points = { { 0.4, 0 }, { 0.2, 1 } } })

-- Animations
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })

-- Windows and Workspaces rule
hl.window_rule({
    match = { title = "foot" },
    opacity = "0.8 0.8"
})

hl.window_rule({
    match = { title = "foot", float = true },
    opacity = "0.7 0.7"
})

hl.window_rule({
    match = { float = true },
    opacity = "0.95 0.95",
    border_size = 2,
    rounding = 10
})

-- File open
hl.window_rule({
    match = { title = "Open Folder|Open File|Save File|Select File|Choose File|Choose one.*" },
    float = true,
    center = true,
    size = { "60%", "70%" }
})

-- Side widget
local monitor = hl.get_monitor_at(0, 0)
local monitor_width = 0
local monitor_height = 0
local monitor_scale = 1
if monitor then
    monitor_width = monitor.width
    monitor_height = monitor.height
    monitor_scale = monitor.scale
end
local float_side_width = 0.35 * monitor_width / monitor_scale
local float_side_height = 0.6 * monitor_height / monitor_scale
hl.window_rule({
    match = { title = "float_side" },
    float = true,
    size = { float_side_width, float_side_height },
    move = { monitor_width / monitor_scale - float_side_width, monitor_height / monitor_scale - float_side_height },
    pin = true,
    border_size = 0,
    opacity = "0.8 0.8"
})
