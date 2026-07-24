hl.config({
    general = {
        border_size = 1,
        gaps_in = 10,
        gaps_out = 16,

        ["col.active_border"] = {
            colors = {
                "rgb(67E8F9)",
                "rgb(8B5CF6)",
                "rgb(D68CA6)",
                "rgb(FF6B6B)",
            },
            angle = 45,
        },

        ["col.inactive_border"] = "rgba(14161f99)",
    },

    decoration = {
        rounding = 18,
        rounding_power = 2,

        active_opacity = 0.90,
        inactive_opacity = 0.70,

        dim_inactive = false,
        dim_strength = 0.05,

        blur = {
            enabled = true,
            size = 8,
            passes = 3,
            ignore_opacity = true,
            new_optimizations = true,

            noise = 0.02,
            contrast = 0.9,
            brightness = 0.8,
            vibrancy = 0.18,
            vibrancy_darkness = 0.1,
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
        namespace = "waybar",
    },
    blur = true,
    ignore_alpha = 0.15,
})

