hl.config({
    general = {
        border_size = 1,
        gaps_in = 10,
        gaps_out = 16,

        ["col.active_border"] = {
            colors = {
                "rgb(53f9ff)",
                "rgb(5846fd)",
                "rgb(ff0088)",
                "rgb(301dff)",
            },
            angle = 10,
        },
        ["col.inactive_border"] = "rgba(14161f99)",
    },

    decoration = {
        rounding = 25,
        rounding_power = 2,

        active_opacity = 0.90,
        inactive_opacity = 0.7,

        dim_inactive = false,
        dim_strength = 0.05,

        blur = {
            enabled = true,
            size = 4,
            passes = 2,
            ignore_opacity = true,
            new_optimizations = true,

            noise = 0.01,
            contrast = 1.1,
            brightness = 0.8,
            vibrancy = 2,
            --vibrancy = 0.9,

            --vibrancy_darkness = 0.1,
            vibrancy_darkness = 0.2,
        },

        shadow = {
            enabled = true,
            range = 6,
            render_power = 2,
            color = "rgba(00000022)",
        },
    },
})

hl.layer_rule({
    match = {
        namespace = "rofi",
    },
    blur = true,
    ignore_alpha = 0.2,
})

hl.layer_rule({
    match = {
        namespace = "waybar",
    },
    blur = true,
    ignore_alpha = 0.5,
    animation = "slide top",
})