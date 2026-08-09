# Inventario declarativo de Arch Linux

## Propósito

Definir el conjunto de paquetes, aplicaciones, componentes y dependencias que
LinuxPC pretende conservar y reconstruir en Arch Linux. El inventario distingue:

- **estado previsto:** selección revisada y versionada en el repositorio;
- **estado observado:** contenido que Pacman, Yay, Flatpak y el sistema declaran
  instalado en el momento de la consulta;
- **dependencia directa:** herramienta consumida por una configuración, script
  o procedimiento mantenido, aunque Pacman la marque como dependencia;
- **dependencia transitiva:** paquete instalado para satisfacer a otro paquete,
  sin responsabilidad directa conocida en LinuxPC;
- **aplicación opcional:** capacidad aceptada que no es necesaria para iniciar
  ni administrar el sistema principal;
- **fuente externa:** instalación o modificación no administrada directamente
  por Pacman.

Una diferencia entre las listas y el sistema no se resuelve automáticamente. El
sistema autoriza qué está instalado; las listas autorizan qué se pretende
conservar. Este documento explica el motivo y la clasificación, pero no instala,
elimina ni cambia la razón de instalación de ningún paquete.

## Fuentes canónicas

| Fuente | Responsabilidad |
|---|---|
| [`packages/arch-official.txt`](../packages/arch-official.txt) | Pertenencia prevista de paquetes oficiales y dependencias directas aceptadas |
| [`packages/arch-aur.txt`](../packages/arch-aur.txt) | Pertenencia prevista de paquetes AUR explícitamente aceptados |
| [`packages/arch-flatpak.txt`](../packages/arch-flatpak.txt) | Pertenencia prevista de aplicaciones Flatpak |
| Pacman y su base de datos local | Paquetes efectivamente instalados y razón de instalación observada |
| Yay y la base local de Pacman | Paquetes AUR o externos efectivamente instalados |
| Flatpak | Aplicaciones Flatpak efectivamente instaladas y alcance aplicado |
| Este documento | Categoría, motivo, estado, consumidor, verificación y brechas |

Las listas contienen un nombre o identificador por línea, sin versiones ni
comentarios. No son exportaciones de `pacman -Qqe`: incluyen solo decisiones
revisadas. Los paquetes pendientes o excluidos se registran aquí y no pertenecen
a las listas.

## Estado observado durante P1-03

Fecha de observación: 29 de julio de 2026.

La consulta utilizada para preparar el inventario registró:

| Conjunto | Cantidad |
|---|---:|
| Paquetes instalados | 870 |
| Paquetes explícitos | 117 |
| Explícitos oficiales | 104 |
| Explícitos AUR o externos | 13 |
| Paquetes instalados como dependencias | 753 |
| Paquetes AUR o externos totales | 20 |
| Huérfanos observados | 10 |
| Aplicaciones Flatpak de sistema | 1 |
| Aplicaciones Flatpak de usuario | 0 |

Estas cantidades son evidencia temporal, no objetivos que una reconstrucción
deba reproducir exactamente.

## Clasificación de los 117 paquetes explícitos

Todos los paquetes que Pacman marcaba como explícitos durante la auditoría
quedan clasificados una sola vez:

### Requeridos

`base`, `base-devel`, `bat`, `btop`, `btrfs-progs`, `cliphist`,
`efibootmgr`, `eza`, `fastfetch`, `git`, `grub`, `grub-btrfs`, `hyprland`,
`hyprpaper`, `hyprshot`, `hyprsunset`, `kitty`, `linux`, `linux-firmware`,
`lxsession`, `matuwall`, `networkmanager`, `nvidia-open`, `nvidia-settings`,
`nvidia-utils`, `openssh`, `orchis-theme`, `os-prober`,
`papirus-icon-theme`, `pipewire`, `pipewire-pulse`, `qt5-wayland`,
`qt6-wayland`, `rofi`, `satty`, `snap-pac`, `snapper`, `snappy-switcher`,
`starship`, `sudo`, `sunshine-bin`, `ttf-meslo-nerd`, `waybar`,
`wireplumber`, `wl-clipboard`, `xdg-desktop-portal-hyprland`, `yay`, `yazi`
y `zsh`.

### Opcionales aceptados

`7zip`, `age`, `btrfs-assistant`, `chafa`, `ddrescue`, `discord`,
`dosfstools`, `fd`, `ffmpegthumbnailer`, `firefox`, `firefox-i18n-es-cl`,
`firefox-ublock-origin`, `flatpak`, `fzf`, `inetutils`, `less`,
`libreoffice-still`, `libreoffice-still-es`, `mesa-utils`, `nano`, `nemo`,
`nemo-fileroller`, `neovim`, `pavucontrol`, `rclone`, `ripgrep`, `rsync`,
`rustdesk-bin`, `testdisk`, `texlive-basic`, `texlive-binextra`,
`texlive-fontsrecommended`, `texlive-langspanish`, `texlive-latex`,
`texlive-latexextra`, `texlive-latexrecommended`, `texlive-mathscience`,
`tree`, `ttf-jetbrains-mono-nerd`, `unarchiver`, `unzip`,
`visual-studio-code-bin`, `vlc`, `wget`, `wimlib`, `ytmdesktop-bin`,
`zathura`, `zathura-pdf-mupdf`, `zip` y `zoxide`.

### Pendientes de decisión

`apple_hyprcursor`, `brightnessctl`, `dunst`, `geoclue`, `imagemagick`,
`imv`, `inotify-tools`, `mako`, `mpvpaper`, `nwg-look`,
`polkit-kde-agent`, `python-lz4`, `redshift`, `volantes-cursors-git`,
`waypaper`, `waywallen-display` y `wf-recorder`.

### Excluidos del estado previsto

`yay-debug` queda excluido porque solo aporta símbolos de depuración y no existe
una decisión que justifique conservarlo. Su clasificación no autoriza a
eliminarlo del sistema.

La clasificación suma los 117 explícitos observados: 49 requeridos, 50
opcionales aceptados, 17 pendientes y 1 excluido.

## Dependencias directas promovidas al estado previsto

Los siguientes paquetes oficiales no estaban marcados como explícitos, pero una
configuración o script versionado utiliza directamente sus comandos:

| Paquetes | Motivo y consumidor |
|---|---|
| `bash` | Intérprete de los scripts de `.local/bin/` |
| `coreutils` | `realpath`, `mktemp`, `cp`, `mv`, `install`, `sort`, `head`, `date`, `sleep` y otras utilidades de scripts |
| `findutils` | Selección acotada de wallpapers mediante `find` |
| `gawk` | Edición controlada de `hyprpaper.conf` y de preferencias de cursor mediante `awk` |
| `grep` | Verificación del parche local de Matuwall y de la estructura esperada por `cursor-selector` |
| `grim`, `slurp` | Captura de región utilizada por `satty-region` |
| `jq` | Interpretación del estado JSON de Hyprland en `waybar-hover` |
| `playerctl` | Atajos multimedia de Hyprland |
| `procps-ng` | `pgrep` y `pkill` utilizados por scripts y diagnóstico |
| `python` | Inspección, aplicación y validación del parche de Matuwall |
| `sed` | Selección de temas de Btop desde `.zshrc` |
| `systemd` | `systemctl` utilizado por scripts de energía |
| `util-linux` | Exclusión mutua de `waybar-hover` mediante `flock` |

Su presencia en `arch-official.txt` expresa dependencia directa de LinuxPC. No
modifica la razón registrada actualmente por Pacman.

## Categorías funcionales y tabla principal

| Nombre o grupo | Gestor | Categoría | Motivo | Estado | Consumidor | Verificación |
|---|---|---|---|---|---|---|
| `base`, `linux`, `linux-firmware`, `sudo` | Pacman | Sistema base | Arranque y administración mínima de Arch | Requerido | Sistema completo | `pacman -Q` y arranque controlado |
| `bash`, `coreutils`, `findutils`, `gawk`, `grep`, `procps-ng`, `sed`, `systemd`, `util-linux` | Pacman | Sistema base | Utilidades llamadas directamente por scripts versionados | Requerido | `.local/bin/` y `.zshrc` | `pacman -Q` y `command -v` |
| `grub`, `os-prober`, `efibootmgr`, `btrfs-progs`, `grub-btrfs` | Pacman | Arranque y almacenamiento | Arranque múltiple y operación Btrfs | Requerido | GRUB, snapshots y recuperación | `pacman -Q` y comandos de diagnóstico |
| `btrfs-assistant`, `dosfstools`, `ddrescue`, `testdisk`, `wimlib` | Pacman | Arranque y almacenamiento | Administración y rescate manual | Opcional aceptado | Recuperación | `pacman -Q` |
| `networkmanager` | Pacman | Red | Conectividad principal de Arch | Requerido | Sistema | `pacman -Q networkmanager` |
| `inetutils`, `wget` | Pacman | Red | Diagnóstico y transferencias manuales | Opcional aceptado | Operación y recuperación | `pacman -Q` y `command -v` |
| `pipewire`, `pipewire-pulse`, `wireplumber`, `playerctl` | Pacman | Audio y multimedia | Audio de sesión y atajos multimedia | Requerido | Hyprland y sesión | `pacman -Q` y `command -v` |
| `pavucontrol`, `vlc` | Pacman | Audio y multimedia | Control y reproducción multimedia | Opcional aceptado | Uso personal | `pacman -Q` |
| `qt5-wayland`, `qt6-wayland`, `xdg-desktop-portal-hyprland` | Pacman | Entorno gráfico | Compatibilidad Wayland y portal del escritorio | Requerido | Aplicaciones gráficas y Hyprland | `pacman -Q` |
| `orchis-theme`, `papirus-icon-theme`, `ttf-meslo-nerd` | Pacman | Entorno gráfico | Recursos referenciados por GTK, Kitty y el escritorio | Requerido | Dotfiles gráficos | `pacman -Q` e inspección de rutas |
| `ttf-jetbrains-mono-nerd`, `mesa-utils` | Pacman | Entorno gráfico | Fuente alternativa y diagnóstico gráfico | Opcional aceptado | Escritorio | `pacman -Q` |
| `hyprland`, `hyprcursor`, `hyprpaper`, `hyprshot`, `hyprsunset`, `waybar`, `rofi`, `lxsession` | Pacman | Hyprland y sesión | Compositor, Hyprcursor, fondos, captura, barra, lanzador y agente PolicyKit usado | Requerido | `.config/hypr/`, `.config/waybar/` y `cursor-selector` | `pacman -Q` y `command -v` |
| `cliphist`, `wl-clipboard`, `grim`, `slurp`, `satty`, `jq` | Pacman | Hyprland y sesión | Portapapeles, capturas y scripts activos | Requerido | Dotfiles y `.local/bin/` | `pacman -Q` y prueba funcional |
| `matuwall`, `snappy-switcher` | AUR/Yay | Hyprland y sesión | Selector de wallpapers y selector de ventanas configurados | Requerido | Autostart, binds y systemd de usuario | `pacman -Q`, `command -v` |
| `volantes-cursors-git`, `bibata-cursor-theme-bin` | AUR/Yay | Temas de cursor | Temas XCursor Volantes y Bibata ofrecidos por `cursor-selector` | Requerido | `/usr/share/icons` y `cursor-selector` | `pacman -Q` e inspección de rutas |
| `kitty`, `zsh`, `starship`, `eza`, `bat`, `btop`, `fastfetch`, `yazi` | Pacman | Terminal y shell | Flujo principal declarado en dotfiles | Requerido | `.zshrc` y `.config/` | `pacman -Q` y `command -v` |
| `chafa`, `fd`, `fzf`, `less`, `nano`, `neovim`, `ripgrep`, `tree`, `zoxide` | Pacman | Terminal y shell | Navegación, búsqueda, edición y utilidades auxiliares | Opcional aceptado | Terminal y Yazi | `pacman -Q` y `command -v` |
| `base-devel`, `git` | Pacman | Desarrollo | Construcción AUR y control de versiones | Requerido | Repositorio y Yay | `pacman -Q` |
| `visual-studio-code-bin` | AUR/Yay | Desarrollo | Edición y trabajo remoto documentados | Opcional aceptado | Desarrollo | `pacman -Q visual-studio-code-bin` |
| `firefox`, localización y extensión empaquetada | Pacman | Estudio y productividad | Navegación principal con idioma y bloqueo de contenido | Opcional aceptado | Uso personal | `pacman -Q` |
| LibreOffice y localización | Pacman | Estudio y productividad | Suite ofimática documentada | Opcional aceptado | Estudio y trabajo | `pacman -Q` |
| Colecciones `texlive-*`, Zathura y backend PDF | Pacman | Estudio y productividad | Flujo LaTeX y lectura de PDF | Opcional aceptado | Estudio | `pacman -Q` y compilación/lectura de muestra |
| `discord`, `ytmdesktop-bin` | Pacman y AUR/Yay | Estudio y productividad | Comunicación y multimedia personal | Opcional aceptado | Funciones de `.zshrc` y uso personal | `pacman -Q` y `command -v` |
| `nemo`, `nemo-fileroller`, `ffmpegthumbnailer`, `unarchiver` | Pacman | Estudio y productividad | Gestión gráfica y previsualización de archivos | Opcional aceptado | Escritorio | `pacman -Q` |
| `7zip`, `unzip`, `zip` | Pacman | Recuperación | Lectura y creación de archivos usados en transferencias y restauración | Opcional aceptado | Recuperación y datos | `pacman -Q` |
| `snapper`, `snap-pac` | Pacman | Recuperación | Snapshots y registro automático asociado a Pacman | Requerido | Recuperación | `pacman -Q` y prueba controlada |
| `age`, `rclone`, `rsync` | Pacman | Recuperación | Cifrado y copia manual | Opcional aceptado | Recuperación | `pacman -Q` y prueba controlada |
| `openssh` | Pacman | Acceso remoto | Administración y edición desde macOS | Requerido | SSH y Rofi | `pacman -Q openssh` y prueba controlada |
| `sunshine-bin`, `rustdesk-bin` | AUR/Yay | Acceso remoto | Escritorio remoto principal y alternativa | Requerido / opcional aceptado | Acceso remoto | `pacman -Q` y prueba del canal |
| `nvidia-open`, `nvidia-utils`, `nvidia-settings` | Pacman | Hardware NVIDIA | Controlador y comandos usados por Waybar | Requerido | LinuxPC y `waybar-gpu` | `pacman -Q`, `nvidia-smi` |
| `flatpak` | Pacman | Aplicaciones opcionales | Gestor aceptado para aplicaciones externas | Opcional aceptado | Waywallen | `pacman -Q flatpak` |
| `org.waywallen.waywallen` | Flatpak, alcance `system` | Flatpaks | Aplicación Waywallen aceptada; su integración AUR sigue pendiente | Opcional aceptado | Flujo de wallpapers | `flatpak info --system` |
| `yay` | AUR/Yay | Paquetes AUR | Gestión reproducible de paquetes AUR aceptados | Requerido | Inventario AUR | `pacman -Q yay` y `command -v yay` |

Los paquetes requeridos y opcionales aceptados aparecen en las listas
procesables. Los grupos no sustituyen el detalle de pertenencia de esas listas.

## Servicios y componentes esperados

Esta tabla registra existencia prevista, no habilitación, enlaces ni estado
activo:

| Paquete proveedor | Función esperada | Debe existir como componente |
|---|---|---|
| `networkmanager` | Conectividad principal | Sí |
| `pipewire`, `pipewire-pulse`, `wireplumber` | Audio de la sesión | Sí |
| `xdg-desktop-portal-hyprland` | Portal del escritorio Wayland | Sí |
| `lxsession` | Proveer `lxpolkit` para la sesión | Sí |
| `hyprpaper` | Motor de wallpaper actual | Sí |
| `hyprsunset` | Temperatura de color declarada actualmente | Sí, sujeto a P1-07 |
| `matuwall` | Selector y daemon de wallpapers | Sí |
| `snappy-switcher` | Selector de ventanas | Sí |
| `openssh` | Acceso administrativo remoto | Sí |
| `sunshine-bin` | Escritorio remoto principal | Sí |
| `rustdesk-bin` | Canal remoto alternativo | Opcional |
| `snapper`, `snap-pac`, `grub-btrfs` | Snapshots e integración de recuperación | Sí |

La verificación de unidades, habilitación, enlaces y configuración efectiva
queda registrada en el inventario completado de P1-04.

## Dependencias externas

| Elemento | Propietario | Ubicación | Verificación | Recuperación |
|---|---|---|---|---|
| Codex standalone | Oscar | Instalación bajo `~/.codex/packages/standalone/current` y enlace en `~/.local/bin/codex` | `readlink ~/.local/bin/codex` y `codex --version` | Reinstalar Codex; el procedimiento declarativo permanece pendiente |
| Parche local de Matuwall | Oscar | Destino del módulo Python descubierto por `.local/bin/matuwall-linuxpc-patch`; respaldo bajo `~/.local/share/linuxpc-backups/matuwall` | `matuwall-linuxpc-patch status` | `matuwall-linuxpc-patch restore`; automatización pendiente en P2-01 |
| Temas Oreo XCursor y temas Hyprcursor convertidos | Oscar | `~/.local/share/icons`; cada tema Hyprcursor contiene `manifest.hl` | Inspección de las rutas y del manifest usados por `cursor-selector` | Pendiente: no hay fuentes ni procedimiento de reconstrucción verificados; su disponibilidad no está completamente reproducida |

No se detectaron aplicaciones de usuario administradas por Pipx, npm, Cargo o
RubyGems. Los scripts de `.local/bin/` pertenecen al repositorio y no constituyen
instalaciones externas separadas.

## Decisiones pendientes

Estas observaciones no modifican las listas hasta que el proyecto responsable
adopte una decisión:

| Decisión | Estado observado | Proyecto |
|---|---|---|
| Hyprpaper/Matuwall frente a Waypaper, mpvpaper y Waywallen | Hyprpaper y Matuwall forman el flujo documentado; las alternativas e integración se solapan | P1-07 y P1-09 |
| Dunst frente a Mako | Ambos están instalados explícitamente sin autoridad declarada | P1-07 |
| Redshift frente a Hyprsunset | Ambos están presentes; Hyprsunset aparece en el autostart versionado | P1-07 y P1-09 |
| Agentes PolicyKit | `lxpolkit` es llamado por Hyprland; existe otro agente explícito | P1-07 y P1-09 |
| Temas de cursor | Volantes y Bibata tienen paquetes AUR comprobados; Oreo y los temas Hyprcursor convertidos son recursos locales sin fuente ni reconstrucción verificadas | P2-04 |
| `yay-debug` | Símbolos de depuración explícitos sin justificación | Excluido; revisar solo si aparece una necesidad de diagnóstico |
| Huérfanos | Cinco paquetes de depuración y cinco herramientas o bibliotecas sin dependientes | P1-15; no promover ni eliminar automáticamente |
| Brightnessctl, Geoclue, ImageMagick, imv, inotify-tools, nwg-look y wf-recorder | Explícitos sin propósito canónico suficiente | P1-07 o P1-15 según su función |
| `python-lz4` | Explícito sin consumidor directo documentado | P1-15 |
| Waywallen Flatpak e integración AUR | El Flatpak se acepta como aplicación opcional; la necesidad de la integración AUR no está resuelta | P1-07 y P2-01 |

Los huérfanos observados fueron `cargo-about`, `go`, `libsoup-debug`, `mold`,
`mpvpaper-debug`, `php-apache`, `protobuf`, `snappy-switcher-debug`,
`sunshine-bin-debug` y `waywallen-display-debug`. Esta lista es evidencia
temporal y no autoriza su eliminación.

## Auditoría y reproducibilidad

El inventario permite:

- comparar paquetes oficiales previstos con `pacman -Qq`;
- comparar paquetes AUR previstos con `pacman -Qqm`;
- comparar identificadores Flatpak con `flatpak list --app`;
- detectar paquetes faltantes sin tratar automáticamente los adicionales como
  errores;
- reconstruir las capacidades declaradas sin enumerar todas las dependencias
  transitivas;
- identificar qué dotfile, script o procedimiento justifica una dependencia;
- revisar por separado paquetes pendientes, excluidos y huérfanos.

La instalación automática, el cambio de razones de Pacman y la eliminación de
paquetes quedan fuera de P1-03.

## Proyectos derivados

| Proyecto | Responsabilidad |
|---|---|
| [P1-04 — Inventario de configuración del sistema](18-inventario-configuracion-sistema.md), completado | Verificar unidades, enlaces, habilitación, archivos y configuración efectiva fuera del repositorio |
| P1-05 — Contrato de reconstrucción de Arch | Definir las capacidades y pruebas que consumen este inventario |
| P1-07 — Baseline de servicios esenciales | Resolver servicios solapados y comportamiento esperado |
| P1-08 — Seguridad y acceso desde macOS | Consolidar canales remotos, exposición y recuperación |
| P1-09 — Ciclo de vida de la sesión Hyprland | Definir autostart, demonios y cierre de sesión |
| P1-13 — Flujo de terminal | Consolidar shell, terminal y utilidades personales |
| P1-15 — Entorno de estudio y desarrollo | Decidir lenguajes, toolchains y aplicaciones de productividad |
| P2-01 — Automatización de reconstrucción | Consumir las listas en un despliegue con puntos de revisión |
| P2-03 — Verificación de estado y divergencias | Automatizar comparaciones entre estado previsto y observado |

## Resultado de P1-03

Los paquetes explícitos están clasificados; las fuentes oficiales, AUR y
Flatpak están separadas; las dependencias directas de dotfiles están declaradas;
y las fuentes externas, decisiones pendientes y brechas posteriores tienen
responsable. El inventario permite auditar faltantes sin convertir dependencias
transitivas, huérfanos o paquetes de depuración en estado previsto.
