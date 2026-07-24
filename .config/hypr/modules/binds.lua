---abrir kitty
hl.bind(
	"SUPER + Q",
	hl.dsp.exec_cmd("kitty"),
	{ description = "Abrir Kitty" }
)


--cerrar ventana activa
hl.bind(
	"SUPER + C",
	hl.dsp.window.close(),
	{ description = "Cerrar ventana"}
)



--abrir rofi
hl.bind(
	"SUPER + R",
	hl.dsp.exec_cmd("rofi -show drun"),
	{ description = "Abrir Rofi" }
)




-- Captura de pantalla


-- Seleccionar un área
hl.bind(
    "SUPER + SHIFT + S",
    hl.dsp.exec_cmd("hyprshot -m region --clipboard-only")
)

-- Capturar una ventana
hl.bind(
    "SUPER + SHIFT + W",
    hl.dsp.exec_cmd("hyprshot -m window --clipboard-only")
)

-- Capturar un monitor
hl.bind(
    "SUPER + SHIFT + A",
    hl.dsp.exec_cmd("hyprshot -m output --clipboard-only")
)


-- Abrir explorador
hl.bind(
    "SUPER + E",
    hl.dsp.exec_cmd("nemo"),
    { description = "Abrir Nemo" }
)

-- Workspaces: 
-- SUPER + número: ir al workspace
-- SUPER + SHIFT + número: mover la ventana al workspace

for i = 1, 9 do
    hl.bind(
        "SUPER + " .. i,
        hl.dsp.focus({ workspace = i }),
        { description = "Ir al workspace " .. i }
    )

    hl.bind(
        "SUPER + SHIFT + " .. i,
        hl.dsp.window.move({
            workspace = i,
            follow = true,
        }),
        { description = "Mover ventana al workspace " .. i }
    )
end

-- ALT + TAB anterior desactivado
-- hl.bind(
--     "ALT + TAB",
--     hl.dsp.window.cycle_next({ hist = true }),
--     { description = "Ventana siguiente" }
-- )

-- ALT + SHIFT + TAB anterior desactivado
-- hl.bind(
--     "ALT + SHIFT + TAB",
--     hl.dsp.window.cycle_next({
--         visible = true,
--         previous = true,
--         hist = true,
--     }),
--     { description = "Ventana anterior visible" }
-- )

-- Volumen

hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+"),
    { description = "Subir volumen" }
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { description = "Bajar volumen" }
)

hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { description = "Silenciar audio" }
)

-- Mover ventanas con SUPER + clic izquierdo
hl.bind(
    "SUPER + mouse:272",
    hl.dsp.window.drag(),
    { mouse = true }
)

-- Redimensionar con SUPER + clic derecho
hl.bind(
    "SUPER + mouse:273",
    hl.dsp.window.resize(),
    { mouse = true }
)


-- Spotlight: abrir aplicaciones
hl.bind(
    "SUPER + SPACE",
    hl.dsp.exec_cmd("rofi -show drun"),
    { description = "Abrir aplicaciones" }
)


hl.bind(
    "ALT + TAB",
    hl.dsp.exec_cmd("snappy-switcher next --mod alt"),
    { description = "Ventana siguiente" }
)

hl.bind(
    "ALT + SHIFT + TAB",
    hl.dsp.exec_cmd("snappy-switcher prev --mod alt"),
    { description = "Ventana anterior" }
)



-- -- Alt + Tab: cambiar entre ventanas
-- hl.bind(
--     "ALT + TAB",
--     hl.dsp.exec_cmd("rofi -show window"),
--     { description = "Cambiar ventana" }
-- )


-- Controles multimedia

hl.bind(
    "XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { description = "Reproducir o pausar" }
)

hl.bind(
    "XF86AudioNext",
    hl.dsp.exec_cmd("playerctl next"),
    { description = "Siguiente pista" }
)

hl.bind(
    "XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl previous"),
    { description = "Pista anterior" }
)

hl.bind(
    "XF86AudioStop",
    hl.dsp.exec_cmd("playerctl stop"),
    { description = "Detener reproducción" }
)



-- Alternar ventana entre mosaico y flotante
hl.bind(
    "SUPER + V",
    hl.dsp.window.float({ action = "toggle" }),
    { description = "Alternar ventana flotante" }
)