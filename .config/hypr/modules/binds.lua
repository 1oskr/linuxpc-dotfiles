---abrir kitty
hl.bind(
	"SUPER + C",
	hl.dsp.exec_cmd("kitty"),
	{ description = "Abrir Kitty" }
)


--cerrar ventana activa
hl.bind(
    "ALT + Q",
	hl.dsp.window.close(),
	{ description = "Cerrar ventana"}
)

-- Bloquear sesión
hl.bind(
    "SUPER + L",
    hl.dsp.exec_cmd("loginctl lock-session"),
    { description = "Bloquear sesión" }
)

hl.bind(
    "SUPER + ESCAPE",
    hl.dsp.exec_cmd("~/.local/bin/powermenu"),
    { description = "Abrir menú de apagado" }
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

-- Guardar captura de región
hl.bind(
    "SUPER + SHIFT + CTRL + S",
    hl.dsp.exec_cmd("hyprshot -m region -o ~/Imágenes/Screenshots"),
    { description = "Guardar captura de región" }
)

-- Guardar captura de ventana
hl.bind(
    "SUPER + SHIFT + CTRL + W",
    hl.dsp.exec_cmd("hyprshot -m window -o ~/Imágenes/Screenshots"),
    { description = "Guardar captura de ventana" }
)


-- Abrir explorador
hl.bind(
    "SUPER + E",
    hl.dsp.exec_cmd("kitty -e yazi"),
    { description = "Abrir Yazi" }
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

-- Historial del portapapeles
hl.bind(
    "SUPER + ALT + SPACE",
    hl.dsp.exec_cmd("~/.local/bin/cliphist-rofi"),
    { description = "Abrir historial del portapapeles" }
)


-- Captura de región con anotaciones
hl.bind(
    "SUPER + SHIFT + X",
    hl.dsp.exec_cmd("~/.local/bin/satty-region"),
    { description = "Capturar y anotar región" }
)

-- Selector de wallpapers
hl.bind(
    "SUPER + ALT + W",
    hl.dsp.exec_cmd("~/.local/bin/wallpaper-selector")
)

-- Selector de luz cálida
hl.bind(
    "SUPER + ALT + N",
    hl.dsp.exec_cmd("~/.local/bin/hyprsunset-selector"),
    { description = "Controlar luz cálida" }
)

-- Grupos de ventanas: pestañas manuales
hl.bind(
    "SUPER + F1",
    hl.dsp.group.toggle(),
    { description = "Crear o deshacer grupo" }
)

hl.bind(
    "SUPER + ALT + RIGHT",
    hl.dsp.group.next(),
    { description = "Pestaña siguiente del grupo" }
)

hl.bind(
    "SUPER + ALT + LEFT",
    hl.dsp.group.prev(),
    { description = "Pestaña anterior del grupo" }
)

hl.bind(
    "SUPER + ALT + SHIFT + RIGHT",
    hl.dsp.group.move_window(),
    { description = "Mover pestaña hacia adelante" }
)

hl.bind(
    "SUPER + ALT + SHIFT + LEFT",
    hl.dsp.group.move_window({ forward = false }),
    { description = "Mover pestaña hacia atrás" }
)

hl.bind(
    "SUPER + ALT + O",
    hl.dsp.window.move({ out_of_group = true }),
    { description = "Sacar ventana del grupo" }
)

hl.bind(
    "SUPER + ALT + L",
    hl.dsp.group.lock_active({ action = "toggle" }),
    { description = "Bloquear o desbloquear grupo activo" }
)

-- Foco direccional entre ventanas
hl.bind(
    "SUPER + LEFT",
    hl.dsp.focus({ direction = "l" }),
    { description = "Enfocar ventana izquierda" }
)

hl.bind(
    "SUPER + RIGHT",
    hl.dsp.focus({ direction = "r" }),
    { description = "Enfocar ventana derecha" }
)

hl.bind(
    "SUPER + UP",
    hl.dsp.focus({ direction = "u" }),
    { description = "Enfocar ventana arriba" }
)

hl.bind(
    "SUPER + DOWN",
    hl.dsp.focus({ direction = "d" }),
    { description = "Enfocar ventana abajo" }
)

-- Mover ventana direccionalmente
hl.bind(
    "SUPER + SHIFT + LEFT",
    hl.dsp.window.move({ direction = "l" }),
    { description = "Mover ventana a la izquierda" }
)

hl.bind(
    "SUPER + SHIFT + RIGHT",
    hl.dsp.window.move({ direction = "r" }),
    { description = "Mover ventana a la derecha" }
)

hl.bind(
    "SUPER + SHIFT + UP",
    hl.dsp.window.move({ direction = "u" }),
    { description = "Mover ventana arriba" }
)

hl.bind(
    "SUPER + SHIFT + DOWN",
    hl.dsp.window.move({ direction = "d" }),
    { description = "Mover ventana abajo" }
)
