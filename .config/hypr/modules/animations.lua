hl.curve("smooth", {
    type = "bezier",
    points = {
        { 0.25, 0.10 },
        { 0.25, 1.00 },
    },
})

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 4,
    bezier = "smooth",
    style = "popin 85%",
})

hl.animation({
    leaf = "windowsMove",
    enabled = true,
    speed = 3,
    bezier = "smooth",
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 3,
    bezier = "smooth",
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 4,
    bezier = "smooth",
    style = "slidefade 20%",
})
