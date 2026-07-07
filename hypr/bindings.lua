local mainMod = "SUPER"

-- Core binds
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("foot"))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.window.kill())
hl.bind(mainMod .. " + ALT + escape", hl.dsp.exit())
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("pear-desktop"))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("nemo"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("wofi --show drun"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("nwg-displays"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("wofi-emoji"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("~/.config/hypr/scripts/show_wifi"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("~/.config/hypr/scripts/show_bt"))

-- Layout and window state
hl.bind(mainMod .. " + TAB", hl.dsp.window.cycle_next())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))  -- toggle dwindle split H ↔ V

hl.bind(mainMod .. " + X", function()
    local monitor = hl.get_active_monitor()
    hl.dispatch(hl.dsp.window.float({ action = "set" }))
    hl.dispatch(hl.dsp.window.resize({ x = 1000, y = 600, relative = false }))
    hl.dispatch(hl.dsp.window.move({ x = monitor.width/4 - 500, y = monitor.height / 2 - 20, relative = false }))
end)

hl.bind(mainMod .. " + V", function()
    hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
    hl.dispatch(hl.dsp.window.resize({ x = 1000, y = 600, relative = false }))
    hl.dispatch(hl.dsp.window.center())
end)

hl.bind(mainMod .. " + S", hl.dsp.window.move({ workspace = "special:special" }))
hl.bind(mainMod .. " + ALT + right", hl.dsp.window.move({ monitor = "+1" }))
hl.bind(mainMod .. " + ALT + left", hl.dsp.window.move({ monitor = "-1" }))

-- Focus
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }))

-- Workspaces
for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = tostring(i) }))
    hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = tostring(i) }))
end
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = "10" }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = "10" }))

-- Mouse Binds
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Multimedia & Laptop Keys
hl.bind("XF86PowerOff", hl.dsp.exec_cmd("~/.config/hypr/scripts/show_bat"))
hl.bind("XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ && bash ~/.config/hypr/scripts/show_volume & wpctl set-mute @DEFAULT_AUDIO_SINK@ 0"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && bash ~/.config/hypr/scripts/show_volume &"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && bash ~/.config/hypr/scripts/show_volume &"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+ && bash ~/.config/hypr/scripts/show_bright &"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%- && bash ~/.config/hypr/scripts/show_bright &"),
    { locked = true, repeating = true })

-- Playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Screenshot & Utilities
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(
    [[IMG=~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%m-%s).png && grim -g "$(slurp)" $IMG && wl-copy < $IMG]]))
hl.bind(mainMod .. " + i", hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind(mainMod .. " + l", hl.dsp.exec_cmd("hyprlock"))

