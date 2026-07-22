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