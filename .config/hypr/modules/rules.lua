hl.window_rule({
    name = "ytm-opacity",
    match = {
        initial_class = "^YouTube Music Desktop App$",
    },
    opacity = "0.9 override 0.5 override",
})

hl.window_rule({
    match = {
        initial_class = "^com[.]microsoft[.]VSCode$",
    },
    workspace = "1",
})

hl.window_rule({
    match = {
        initial_class = "^kitty$",
    },
    workspace = "1",
})

hl.window_rule({
    match = {
        initial_class = "^Chatgpt$",
    },
    workspace = "2",
})

hl.window_rule({
    match = {
        initial_class = "^firefox$",
    },
    workspace = "3",
})

hl.layer_rule({
    name = "no-anim-selection",
    match = {
        namespace = "selection",
    },
    no_anim = true,
})
