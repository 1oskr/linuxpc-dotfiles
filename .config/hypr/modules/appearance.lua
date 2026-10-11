local function read_theme_mode()
    local home = os.getenv("HOME")
    local state_home = os.getenv("XDG_STATE_HOME")

    if not home then
        return "light"
    end

    local state_root = state_home or (home .. "/.local/state")
    local file = io.open(state_root .. "/linuxpc/theme-mode", "r")

    if not file then
        return "light"
    end

    local mode = file:read("*a")
    file:close()

    if mode == "dark" or mode == "dark\n" then
        return "dark"
    end

    return "light"
end

local theme = require("themes." .. read_theme_mode())

hl.config({
    general = {
        border_size = 0,
        gaps_in = 4,
        gaps_out = 2,

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
        rounding = 16,
        rounding_power = 3,

        active_opacity = 1,
        inactive_opacity = 1,

        dim_inactive = false,
        dim_strength = 0.05,

        blur = {
            enabled = true,
            size = 2,
            passes = 3,
            vibrancy = 0.2,
            contrast = 0.9,
            brightness = 1.0,

            --ignore_opacity = true,
            --new_optimizations = true,
            --noise = 0.01,


            --contrast = 1.1,
            --brightness = 0.8,
            --vibrancy = 2,
            --vibrancy = 0.9,

            --vibrancy_darkness = 0.1,
            --vibrancy_darkness = 0.2,
        },

        shadow = {
            enabled = true,
            range = 12,
            render_power = 2,
            color = "rgba(00000022)",
        },
    },

    group = {
        auto_group = false,

        groupbar = {
            enabled = true,
            height = 30,
            font_family = "Google Sans Flex 9pt",
            font_weight_active = "bold",
            font_weight_inactive = "normal",
            font_size = 14,
            render_titles = true,
            scrolling = true,
            middle_click_close = false,

            gradients = true,
            indicator_height = 0,
            gradient_rounding = 10,
            gradient_round_only_edges = true,
            gaps_in = 0,
            gaps_out = 0,
            text_color = theme.text_color,
            text_color_inactive = theme.text_color_inactive,

            col = {
                active = theme.col.active,
                inactive = theme.col.inactive,
            },
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

hl.layer_rule({
    match = {
        namespace = "nwg-dock",
    },
    blur = true,
    ignore_alpha = 0.2,
    animation = "slide bottom",
})
