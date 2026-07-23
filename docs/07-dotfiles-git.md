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

## Estado actual

Último commit documentado:

```text
0a2009e Agregar configuración de Zsh y script de apagado
```

El repositorio local está sincronizado con:

```text
origin/main
```

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
.config/starship.toml
```

### Zsh

```text
.zshrc
```

### Scripts personales

```text
.local/bin/
```

## Archivos que no deben subirse

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