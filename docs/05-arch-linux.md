# Arch Linux

## Rol del sistema

Arch Linux es el sistema operativo principal del equipo.

La selección prevista de paquetes, aplicaciones y dependencias se define en el
[inventario declarativo de Arch Linux](17-inventario-arch.md). El sistema activo
continúa autorizando qué está instalado en el momento de la consulta.

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
arch
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

El esquema completo de subvolúmenes y montajes persistentes está en el
[inventario de configuración del sistema](18-inventario-configuracion-sistema.md).

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
rules.lua
workspaces.lua
```

Configuración específica del equipo:

```text
~/.config/hypr/machines/linuxpc.lua
```

`hyprland.lua` carga este perfil, que concentra la topología física de
LinuxPC. `modules/monitors.lua` ya no existe.

Topología comprobada después de `hyprctl reload`:

| Salida | Monitor | Modo | Posición | Escala |
|---|---|---|---|---:|
| `DP-1` | Samsung LC24RG50 | 1920x1080@143.98 | `0x0` | 1 |
| `DP-2` | Samsung LS27DG30X | 1920x1080@180 | `1920x0` | 1 |
| `HDMI-A-1` | Samsung S24F350 | 1920x1080@60 | `3840x0` | 1 |

### Modelo de workspaces y ventanas

**Implementado y probado en P1-11:** los workspaces son globales y libres;
no están asignados a monitores y `modules/workspaces.lua` no introduce reglas
especiales. `SUPER + 1..9` enfoca directamente el workspace indicado. `SUPER +
SHIFT + 1..9` mueve la ventana activa al workspace indicado y la sigue.

La navegación direccional usa `SUPER + LEFT/RIGHT/UP/DOWN` para enfocar la
ventana en esa dirección. `SUPER + SHIFT + LEFT/RIGHT/UP/DOWN` mueve o reordena
la ventana activa direccionalmente. Ambas operaciones se verificaron también
entre monitores cuando corresponde.

`ALT + TAB` y `ALT + SHIFT + TAB` conservan Snappy Switcher como selector visual
y global complementario. Su configuración versionada usa `follow_monitor =
true`; después de actualizarla se comprobó con `cmp` que coincide con la copia
activa.

No se añadieron atajos `SUPER + CTRL + LEFT/RIGHT`: el movimiento direccional ya
cruza monitores y esos atajos serían redundantes. Las reglas de aplicaciones no
se ampliaron para este modelo; no hay colocación fija por aplicación ni por
monitor.

**Pruebas realizadas:** `hyprctl reload` correcto; navegación y movimiento
direccional, incluido el cruce entre monitores; y Snappy Switcher con
`follow_monitor = true`.

## Componentes del escritorio

### Ciclo de vida de la sesión Hyprland

En `hyprland.start`, Hyprland inicia `hyprland-session.target`; en
`hyprland.shutdown` lo detiene de forma bloqueante antes de terminar.
`graphical-session.target` representa el grupo systemd de la sesión gráfica.

Matuwall es gestionado por `matuwall.service`, que pertenece a
`hyprland-session.target` y se detiene limpiamente mediante `matuwall --quit`.
`waybar-hover.service` y `snappy-switcher.service` pertenecen a
`graphical-session.target`. `xdg-desktop-portal-hyprland.service` es una unidad
proporcionada por el paquete y también pertenece a ese target; no se declara
que este la inicie directamente.

`lxpolkit`, `hyprsunset`, `hyprpaper` y los dos procesos `wl-paste` permanecen
como procesos iniciados directamente por Hyprland. En la validación final de
P1-09, todos terminaron al cerrar la sesión y no quedaron procesos residuales.

Tras desplegar las unidades versionadas, su habilitación se reconstruye con:

```bash
systemctl --user daemon-reload
systemctl --user enable matuwall.service
systemctl --user enable waybar-hover.service snappy-switcher.service
```

Los enlaces creados en `*.target.wants/` por `enable` son estado generado y no
se versionan.

### Waybar

```text
~/.config/waybar/common.jsonc
~/.config/waybar/outputs/HDMI-A-1.jsonc
~/.config/waybar/outputs/DP-1.jsonc
~/.config/waybar/outputs/DP-2.jsonc
~/.config/waybar/style.css
~/.local/bin/waybar-hover
~/.local/bin/waybar-gpu
~/.local/bin/powermenu
```

`common.jsonc` contiene la presentación compartida. Los tres archivos de
`outputs/` son adaptadores específicos de LinuxPC: conservan el identificador
de Waybar y la salida física (`waybar-hdmi`/`HDMI-A-1`, `waybar-dp1`/`DP-1` y
`waybar-dp2`/`DP-2`). `waybar-hover` deriva el adaptador directamente como
`~/.config/waybar/outputs/$monitor.jsonc`; no mantiene una tabla de salida a
archivo.

Cada adaptador incluye la presentación común mediante
`~/.config/waybar/common.jsonc`. Esta arquitectura se validó en HDMI-A-1,
DP-1 y DP-2. El módulo de red abre `wifi-selector` y el de Bluetooth abre
`bluetooth-selector`; ambos selectores se validaron durante P1-12, incluido el
escaneo y el encendido y apagado de Bluetooth.

Waybar utiliza una instancia dinámica gestionada por `waybar-hover`.

Comportamiento comprobado:

- aparece al tocar el borde superior;
- se muestra solo en el monitor donde está el cursor;
- funciona en HDMI-A-1, DP-1 y DP-2;
- funciona sobre ventanas en pantalla completa;
- se destruye al ocultarse para permitir animaciones de entrada y salida;
- `waybar-hover.service` gestiona y reinicia el proceso;
- `waybar-multi` ya no se utiliza.

Funciones principales:

- workspaces y aplicación activa;
- red, audio, CPU, memoria y fecha;
- uso y temperatura de la GPU NVIDIA;
- tooltip con VRAM y consumo eléctrico;
- logo de Arch para abrir el menú de energía.

La integración de `waybar-gpu` conserva `nvidia-smi`. En el sistema real se
verificó la RTX 3060 con `nvidia-open` y `nvidia-utils` 610.57.04; no fue
necesario cambiar la configuración NVIDIA para P1-10.

Diagnóstico:

```bash
pgrep -af 'waybar|waybar-hover'
systemctl --user status waybar-hover.service
journalctl --user -u waybar-hover.service
tail -n 80 /tmp/waybar-HDMI-A-1.log
tail -n 80 /tmp/waybar-DP-1.log
tail -n 80 /tmp/waybar-DP-2.log
```

### Servicios esenciales del escritorio

#### Portapapeles

Los dos procesos `wl-paste` almacenan texto e imágenes en ClipHist. `SUPER +
H` abre el historial mediante `cliphist-rofi`. `copysalida` permanece
desactivado por defecto para no inundar el historial. El historial se limpia al
iniciar y cerrar la sesión Hyprland, por lo que su contenido es estado efímero.

#### Notificaciones

Mako es el único daemon de notificaciones activo. Su timeout por defecto es de
aproximadamente 5 s y respeta los timeouts explícitos enviados por las
aplicaciones; su estilo también se verificó. Dunst permanece instalado, pero
no se usa ni debe competir por el servicio de notificaciones.

#### Bloqueo e inactividad

`SUPER + L` ejecuta `loginctl lock-session`; Hyprlock se comprobó en HDMI-A-1,
DP-1 y DP-2. Hypridle arranca directamente con Hyprland, bloquea la sesión a
los 300 s y apaga DPMS a los 330 s. El apagado y restablecimiento de DPMS se
validaron en los tres monitores. No hay suspensión automática configurada.

### Kitty

```text
~/.config/kitty/kitty.conf
```

### Rofi

```text
~/.config/rofi/config.rasi
~/.config/rofi/theme.rasi
```

### Cursores

Selector implementado y probado visualmente:

```text
~/.local/bin/cursor-selector -> ~/linuxpc-dotfiles/.local/bin/cursor-selector
```

Uso:

```bash
cursor-selector
```

El selector presenta las opciones con Rofi, valida el tema XCursor y el
`manifest.hl` de Hyprcursor elegidos, aplica el cambio inmediato mediante
`hyprctl setcursor` y persiste las variables XCursor e Hyprcursor en
`~/.config/hypr/hyprland.lua`. También actualiza los ajustes GTK 3, GTK 4 y
GSettings activos; si `notify-send` está disponible, muestra una notificación.

| Opción | Tamaño |
|---|---|
| Volantes | 24 |
| Volantes Light | 24 |
| Bibata Modern Ice | 24 |
| Oreo Pink | 32 |
| Oreo Red | 32 |
| Oreo Spark Blue | 32 |
| Oreo Teal | 32 |

Estado comprobado: Oreo Teal, tamaño 32, sincronizado en Hyprland, GTK activos
y GSettings. Los `settings.ini` activos de GTK no están enlazados al
repositorio y los versionados conservan otro estado visual; esta divergencia
no se resuelve aquí y permanece diferida según los
[límites de configuración](16-limites-configuracion.md).

Las dependencias y los límites de reconstrucción de los temas se registran en
el [inventario declarativo de Arch Linux](17-inventario-arch.md).

### Wallpapers

Motor de fondos:

```text
Hyprpaper
```

Selección activa personal/generada:

```text
~/.config/hypr/hyprpaper.conf
```

Selector gráfico principal:

```text
Matuwall
```

Configuración:

```text
~/.config/matuwall/config.json
```

La configuración activa se enlaza al repositorio mediante el directorio:

```text
~/.config/matuwall -> ~/linuxpc-dotfiles/.config/matuwall
```

`config.json` permanece como un archivo regular dentro del repositorio. No debe
reemplazarse por otro enlace al mismo destino, porque se produciría un bucle de
enlaces y Matuwall no podría cargar la configuración.

Directorio de wallpapers:

```text
~/Pictures/Wallpapers/Waywallen
```

Matuwall se ejecuta mediante `matuwall.service`, habilitado para
`hyprland-session.target`; no se inicia directamente desde el autostart de
Hyprland.

Estado del daemon y del canal IPC:

```bash
matuwall --status
pgrep -af 'matuwall --daemon'
```

Flujo comprobado:

```text
Matuwall
→ linuxpc-wallpaper
→ selección de monitor mediante Rofi
→ actualización de hyprpaper.conf
→ aplicación inmediata mediante hyprctl hyprpaper
```

Backend personalizado:

```text
~/.local/bin/linuxpc-wallpaper
```

El script permite aplicar el wallpaper al monitor central, izquierdo, derecho o a todos los monitores.

`linuxpc-wallpaper` y `wallpaper-selector` consultan `hyprctl monitors -j` y
requieren exactamente tres monitores válidos. Ordenan sus posiciones `x`: el
menor corresponde a Izquierdo, el intermedio a Central y el mayor a Derecho.
La validación efectiva resolvió `DP-1`, `DP-2` y `HDMI-A-1`, respectivamente.
`hyprpaper.conf` materializa la selección activa de imágenes y no es fuente
canónica de la topología física.

Selector anterior conservado como alternativa:

```text
~/.local/bin/wallpaper-selector
```

Matuwall utiliza temporalmente un parche local en:

```text
/usr/lib/python3.14/site-packages/matuwall/ui/content.py
```

Respaldo del archivo original:

```text
~/.local/share/linuxpc-backups/matuwall/content.py.original
```

Configuración requerida en Matuwall:

```json
"wall_mode_only": true
```

Script de mantenimiento del parche:

```text
~/.local/bin/matuwall-linuxpc-patch
```

Comandos disponibles:

```bash
matuwall-linuxpc-patch status
matuwall-linuxpc-patch apply
matuwall-linuxpc-patch restore
```

> Una actualización de Matuwall puede sobrescribir el parche. Después de actualizar, ejecuta `matuwall-linuxpc-patch status` y, si corresponde, `matuwall-linuxpc-patch apply`.

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

El módulo `hostname` usa `format = "[@$hostname]($style) "`; conserva el
estilo personal y obtiene el hostname del sistema en tiempo de ejecución. Con
el hostname actual `arch`, el renderizado validado es `@arch`, sin codificarlo
en la configuración.

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

## Acceso remoto

### SSH

SSH es el único canal remoto mantenido para administrar Arch desde macOS.

Estado verificado:

- `sshd.service` habilitado y activo;
- IP fija de Arch: `192.168.1.50`;
- autenticación exclusivamente mediante clave pública;
- autenticación por contraseña desactivada;
- acceso desde macOS mediante `ssh arch`.

Configuración del Mac:

```sshconfig
Host arch
    HostName 192.168.1.50
    User oscar
    IdentityFile ~/.ssh/id_ed25519
    PreferredAuthentications publickey
    PasswordAuthentication no
```
Uso:

```bash
ssh arch
```

Configuración local de seguridad en Arch:

```text
/etc/ssh/sshd_config.d/99-local.conf
```

Contenido:

```text
PasswordAuthentication no
KbdInteractiveAuthentication no
```

### Visual Studio Code Remote SSH

Se utiliza para editar archivos de Arch desde Visual Studio Code en macOS mediante el host:

```text
arch
```

### Servicios eliminados

Se desinstalaron de Arch:

```text
rustdesk-bin
sunshine-bin
sunshine-bin-debug
```

Moonlight no estaba instalado en Arch.

SSH queda como único canal remoto mantenido.

No existe display manager. El inicio gráfico actual conserva el flujo de
inicio de sesión en TTY seguido de `start-hyprland`; esta decisión no bloquea
P1-12 ni forma parte de su alcance obligatorio. El acceso remoto relevante
para ese proyecto sigue siendo SSH, no un escritorio gráfico remoto.
