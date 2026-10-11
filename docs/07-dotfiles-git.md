# Dotfiles y Git

## Objetivo

Mantener las configuraciones importantes del entorno bajo control de versiones para:

- recuperar el sistema;
- comparar cambios;
- revertir errores;
- sincronizar configuraciones;
- automatizar instalaciones futuras;
- documentar la evolución del equipo.

## Repositorio

Ruta local:

```text
~/linuxpc-dotfiles
```

Repositorio remoto:

```text
github.com/1oskr/linuxpc-dotfiles
```

Rama principal:

```text
main
```

La relación entre el estado previsto del repositorio y el estado efectivo de los
sistemas se define en la
[matriz de fuente de verdad](15-matriz-fuente-de-verdad.md).
La clasificación canónica de contenido común, específico, personal, sensible y
generado se define en
[Límites de configuración](16-limites-configuracion.md).

## Verificación del estado

```bash
git status --short --branch
git log -1 --oneline
```

El resultado debe evaluarse en el momento de la consulta. No se mantiene un
identificador de último commit fijo en este documento.

## Estructura principal

```text
.config/
.local/bin/
docs/
drafts/
.zshrc
README.md
.gitignore
.gitattributes
```

## Configuraciones versionadas

### Hyprland

```text
.config/hypr/
```

Incluye:

- configuración principal;
- módulos;
- reglas;
- monitores;
- atajos;
- autostart;
- animaciones;
- configuración específica del equipo.

### Waybar

```text
.config/waybar/
```

Waybar mantiene deliberadamente un único estilo negro en `style.css`, similar
a una barra de menú de macOS. No forma parte de `theme-set` y no debe
separarse en temas light/dark. `waybar-hover` conserva su ciclo de vida y su
gestión dinámica sin depender del selector global.

### Kitty

```text
.config/kitty/
```

### Rofi

```text
.config/rofi/
```

### Btop

```text
.config/btop/
```

### Fastfetch

```text
.config/fastfetch/
```

### Starship

```text
.config/starship/themes/{light,dark}.toml  # fuentes declarativas versionadas
```

`.config/starship/themes/{light,dark}.toml` contiene las fuentes declarativas
versionadas. `theme-set` materializa
atómicamente `~/.config/starship/active.toml` fuera de Git; `.zshrc` establece
`STARSHIP_CONFIG` para que Starship lea efectivamente ese archivo derivado.
La configuración antigua `.config/starship.toml` y su enlace
`~/.config/starship.toml` fueron retirados.

### Zsh

```text
.zshrc
```

### Scripts personales

```text
.local/bin/
```

## Modo claro/oscuro

El modo vigente se conserva como estado mutable fuera de Git en
`${XDG_STATE_HOME:-$HOME/.local/state}/linuxpc/theme-mode`. Sus valores son
`light` y `dark`; `theme-toggle` lee ese archivo y delega el cambio en
`theme-set`.

Para GTK, las fuentes declarativas son:

```text
.config/gtk-3.0/settings.common
.config/gtk-3.0/themes/{light,dark}.settings
.config/gtk-4.0/settings.common
.config/gtk-4.0/themes/{light,dark}.settings
```

`theme-set` combina el archivo común con el fragmento elegido para generar los
`settings.ini` activos. Los tres elementos GTK 4 (`gtk.css`, `gtk-dark.css` y
`assets`) son enlaces simbólicos derivados hacia el tema Orchis instalado en
`/usr/share/themes`; no se copian assets del tema al repositorio. Los
`settings.ini` activos, los enlaces y `theme-mode` no se versionan.

Kitty conserva la configuración común en `.config/kitty/kitty.conf` y las
paletas versionadas en `.config/kitty/themes/{light,dark}.conf`. El archivo común incluye `themes/active.conf`;
este fragmento se materializa atómicamente fuera del repositorio por
`theme-set` y no se versiona. La copia activa
`~/.config/kitty/kitty.conf` está enlazada al archivo del repositorio.

Rofi conserva dos temas completos e independientes en
`.config/rofi/themes/{light,dark}.rasi`, versionados como fuentes
declarativas. La
estructura anterior incluía `.config/rofi/theme.rasi`, que fue retirada del
árbol de trabajo. El config común usa `@theme "theme"`; `theme-set`
materializa atómicamente `~/.config/rofi/theme.rasi` fuera de Git. La
eliminación de la fuente antigua y el seguimiento de los perfiles nuevos forman
parte de esta consolidación Git.
La copia activa `~/.config/rofi/config.rasi` está enlazada al repositorio.

Mako conserva la geometría, fuente y comportamiento comunes en
`.config/mako/config`, e incluye `~/.config/mako/themes/active.conf`. Sus
fragmentos versionados `.config/mako/themes/{light,dark}.conf` contienen
únicamente los tres colores dependientes del modo. `theme-set` materializa atómicamente
`~/.config/mako/themes/active.conf` fuera de Git y recarga Mako si el daemon
está activo. La copia activa `~/.config/mako/config` está enlazada al
repositorio.

Hyprland conserva la apariencia común en `modules/appearance.lua` y los cuatro
colores dependientes del modo del groupbar en los archivos versionados
`.config/hypr/themes/{light,dark}.lua`.
`appearance.lua` lee únicamente el estado persistente `theme-mode`, con
fallback seguro a `light`. Durante una sesión Hyprland accesible, `theme-set`
aplica esos colores mediante una única llamada `hyprctl eval`/`hl.config`; no
se usa `theme-mode.pending` ni se reescriben archivos versionados. Si no hay
socket accesible, el modo se confirma para que el siguiente inicio lo lea
desde el archivo persistente.

### Disponibilidad de los comandos

Los enlaces de `theme-set` y `theme-toggle` aún no están creados en
`~/.local/bin`; `theme-selector` sí está enlazado actualmente al checkout.
Mientras no se creen los primeros enlaces, se puede invocar `theme-set`
directamente desde el checkout:

```bash
~/linuxpc-dotfiles/.local/bin/theme-set light
~/linuxpc-dotfiles/.local/bin/theme-set dark
```

Para disponer de `theme-set` y `theme-toggle` por nombre, desde el directorio
raíz del checkout se pueden crear enlaces en `~/.local/bin`:

```bash
ln -s "$PWD/.local/bin/theme-set" "$HOME/.local/bin/theme-set"
ln -s "$PWD/.local/bin/theme-toggle" "$HOME/.local/bin/theme-toggle"
ln -s "$PWD/.local/bin/theme-selector" "$HOME/.local/bin/theme-selector"
```

La carpeta debe estar en `PATH` para invocarlos por nombre. `theme-toggle`
busca `theme-set` mediante `PATH`, por lo que deben desplegarse ambos enlaces.
`theme-selector` se invoca desde el atajo de Hyprland y delega en `theme-set`
desde el checkout enlazado. El procedimiento no se ha aplicado todavía.
Después del despliegue, los usos son `theme-set light`, `theme-set dark`,
`theme-toggle` y `theme-selector`.

La integración implementada cubre GTK 3, GTK 4, las claves GSettings
`org.gnome.desktop.interface color-scheme` y `gtk-theme`, Kitty, Rofi, Mako,
Starship y los colores del groupbar de Hyprland.
Los temas light y dark de Rofi son diseños completos deliberadamente
distintos; ambos modos fueron aplicados y validados visualmente. Mako conserva
la geometría y el comportamiento comunes y separa solo sus colores por modo;
se comprobaron los cambios de modo. Hyprland separa los cuatro colores del
groupbar por modo y su presentación se validó visualmente en light y dark.
Waybar queda fuera deliberadamente: mantiene siempre su estilo negro y no forma
parte de `theme-set`. Firefox y VS Code tampoco forman parte de este selector.

## Archivos que no deben subirse

Las reglas completas de inclusión y exclusión están en
[Límites de configuración](16-limites-configuracion.md). Esta sección resume las
precauciones operativas para Git.

No almacenar en Git:

- claves privadas SSH;
- tokens;
- contraseñas;
- archivos de sesión;
- cookies;
- bases de datos locales;
- archivos de caché;
- logs;
- copias temporales;
- configuraciones con datos personales sensibles.

Ejemplos:

```text
~/.ssh/id_ed25519
~/.ssh/id_rsa
~/.config/dconf/user
*.bak
*.backup
*.log
```

## Flujo de trabajo

### Revisar cambios

```bash
cd ~/linuxpc-dotfiles
git status
```

### Ver diferencias

```bash
git diff
```

### Preparar cambios

```bash
git add ruta/al/archivo
```

### Revisar cambios preparados

```bash
git diff --cached
```

### Crear commit

```bash
git commit -m "Descripción del cambio"
```

### Subir a GitHub

```bash
git push origin main
```

### Actualizar desde GitHub

```bash
git pull origin main
```

## Verificación final

```bash
git status
git log -1 --oneline
```

Resultado esperado:

```text
Tu rama está actualizada con 'origin/main'.
nada para hacer commit, el árbol de trabajo está limpio
```

## Enlaces simbólicos

Las configuraciones activas deben apuntar al repositorio cuando corresponda.

Ejemplo:

```text
~/.config/hypr -> ~/linuxpc-dotfiles/.config/hypr
```

Verificación:

```bash
ls -ld ~/.config/hypr
```

## Precauciones

- Revisar siempre `git diff` antes de hacer commit.
- Revisar `git diff --cached` antes de subir cambios.
- No ejecutar `git reset --hard` sin respaldo.
- No forzar `git push --force` sobre `main`.
- No subir archivos sensibles.
- Mantener commits pequeños y descriptivos.
- Probar cada configuración antes de subirla.
