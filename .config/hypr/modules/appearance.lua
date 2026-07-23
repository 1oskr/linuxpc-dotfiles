hl.config({
    general = {
        border_size = 1,
        ["col.active_border"] = {
            colors = {
                "rgb(67E8F9)",
                "rgb(8B5CF6)",
                "rgb(D68CA6)",
                "rgb(FF6B6B)",
            },
        angle = 0,
        },
        ["col.inactive_border"] = "rgb(14161f)",
    ---    ["col.active_border"] = "rgb(14161F)", -- oscuro, casi invisible
    ---["col.active_border"] = "rgb(14161f)",
    },

    decoration = {
        rounding = 1,
        active_opacity = 1,
        inactive_opacity = 0.95,

        dim_inactive = true,
        dim_strength = 0.1,

        blur = {
            enabled = true,
            size = 3,
            passes = 2,
        },

        shadow = {
            enabled = true,
            range = 3,
            render_power = 6,
            color = "rgba(00000099)",
        },

    },
})