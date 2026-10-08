hl.workspace_rule({
    workspace = "1",
    monitor = "DP-1",
    default = true,
})

hl.workspace_rule({
    workspace = "2",
    monitor = "DP-2",
    default = true,
})

hl.workspace_rule({
    workspace = "3",
    monitor = "HDMI-A-1",
    default = true,
})

hl.on("hyprland.start", function()
    hl.dispatch(hl.dsp.focus({ workspace = 2 }))
end)
