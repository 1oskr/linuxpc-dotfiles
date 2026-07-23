# Arch Linux

## Rol del sistema

Arch Linux es el sistema operativo principal del equipo.

Se utiliza para:

- estudio;
- programación;
- matemáticas;
- administración del sistema;
- personalización;
- documentación;
- mantenimiento del triple arranque.

## Usuario

```text
oscar
```

## Nombre del equipo

```text
arklinuk
```

## Sistema de archivos

Partición principal:

```text
/dev/nvme0n1p8
```

Sistema de archivos:

```text
Btrfs
```

Subvolúmenes principales:

```text
@
@home
@/var/lib/portables
@/var/lib/machines
```

Puntos de montaje:

```text
@     -> /
@home -> /home
```

## Escritorio

Compositor:

```text
Hyprland
```

Configuración principal:

```text
~/.config/hypr/hyprland.lua
```

Módulos:

```text
~/.config/hypr/modules/
```

Archivos principales:

```text
animations.lua
appearance.lua
autostart.lua
binds.lua
input.lua
monitors.lua
rules.lua
workspaces.lua
```

Configuración específica del equipo:

```text
~/.config/hypr/machines/linuxpc.lua
```

## Componentes del escritorio

### Waybar

```text
~/.config/waybar/config.jsonc
~/.config/waybar/style.css
```

### Kitty

```text
~/.config/kitty/kitty.conf
```

### Rofi

```text
~/.config/rofi/config.rasi
~/.config/rofi/theme.rasi
```

### Hyprpaper

```text
~/.config/hypr/hyprpaper.conf
```

### Hyprsunset

```text
~/.config/hypr/hyprsunset.conf
```

### Snappy Switcher

```text
~/.config/snappy-switcher/config.ini
```

### Starship

```text
~/.config/starship.toml
```

### Btop

```text
~/.config/btop/btop.conf
```

Temas personalizados:

```text
~/.config/btop/themes/blanco.theme
~/.config/btop/themes/oskr.theme
```

### Fastfetch

```text
~/.config/fastfetch/config.jsonc
~/.config/fastfetch/ascii/logo.txt
```

## Shell

Shell principal:

```text
Zsh
```

Configuración:

```text
~/.zshrc
```

Funciones y alias relevantes:

```text
ls -> eza
ll -> eza -lah
cat -> bat
```

Funciones personalizadas:

```text
btop-blanco
btop-oskr
go dc
go ff
copysalida
```

## Scripts personales

Ruta:

```text
~/.local/bin
```

Script de apagado:

```text
~/.local/bin/Apagar
```

Contenido:

```bash
#!/bin/bash
systemctl poweroff
```

## HDD compartido

Punto de montaje:

```text
/mnt/hdd
```

Verificación:

```bash
findmnt /mnt/hdd
```

## Repositorio de dotfiles

Ruta local:

```text
~/linuxpc-dotfiles
```

Repositorio remoto:

```text
github.com/1oskr/linuxpc-dotfiles
```

Las configuraciones activas de Hyprland están enlazadas al repositorio mediante enlaces simbólicos.

Ejemplo:

```text
~/.config/hypr -> ~/linuxpc-dotfiles/.config/hypr
```

## Comandos de diagnóstico

### Sistema

```bash
uname -a
```

```bash
lsblk -o NAME,SIZE,FSTYPE,LABEL,UUID,MOUNTPOINTS,MODEL
```

```bash
findmnt
```

### Hyprland

```bash
hyprctl monitors
```

```bash
hyprctl clients
```

```bash
hyprctl reload
```

### Procesos

```bash
pgrep -af waybar
```

```bash
pgrep -af hyprsunset
```

```bash
pgrep -af hyprpaper
```

## Precauciones

- No editar archivos del sistema sin revisar antes su contenido.
- Editar configuraciones con Visual Studio Code.
- Probar cambios antes de subirlos a Git.
- Verificar `git status` antes de hacer commit.
- No guardar claves SSH, tokens ni contraseñas en el repositorio.
- Mantener copias de seguridad antes de cambios importantes.