# Prueba integral de restauración

## Objetivo

Demostrar que las copias independientes permiten recuperar información íntegra, legible y utilizable sin modificar el sistema principal.

## Fecha

25 de julio de 2026.

## Dotfiles

Se clonó el repositorio desde GitHub en una carpeta temporal:

```text
/tmp/linuxpc-restauracion-dotfiles
```

Verificaciones realizadas:

- `git status -sb` mostró el clon sincronizado con `origin/main`;
- `HEAD` y `origin/main` coincidieron en:

```text
1b018ffffccda4b6e082921a307672d776fd50a4
```

- se confirmó la existencia y lectura de:
  - `.zshrc`;
  - `.config/hypr/hyprland.lua`;
  - `docs/09-roadmap.md`.

Resultado:

```text
DOTFILES_RESTAURADOS_OK
```

## Respaldo cifrado de `/etc`

Se utilizó:

```text
/mnt/hdd/Backups/etc/etc-2026-07-23-0600.tar.gz.age
```

El archivo fue descifrado mediante `age` dentro de una carpeta temporal.

Se verificó que el archivo restaurado:

- era un `tar.gz` legible;
- contenía la estructura de `/etc`;
- permitía extraer archivos individuales.

Muestra restaurada:

```text
etc/hostname
etc/fstab
etc/default/grub
```

Los tres archivos resultaron legibles.

## Datos del HDD desde Google Drive

Se descargó desde la copia independiente de Google Drive:

```text
topicos.zip
```

El archivo fue transferido desde el Mac a Arch mediante `scp`.

Verificaciones realizadas:

- tamaño recibido: aproximadamente 370 MiB;
- `unzip -t` comprobó todos los archivos;
- resultado final:

```text
No errors detected in compressed data
```

Como prueba de utilidad se extrajo:

```text
topicos/Library/English/Atomic_Habits.pdf
```

El sistema lo reconoció como:

```text
PDF document, version 1.4, 20 page(s)
```

## Datos representativos de `/home`

La revisión de `/home/oscar` mostró principalmente:

- dotfiles cubiertos por GitHub;
- Firefox cubierto por Firefox Sync;
- VS Code cubierto por Settings Sync;
- ISOs y herramientas descargables nuevamente;
- copias locales de Firefox;
- `topicos.zip`, restaurado desde Google Drive.

No se identificó otro conjunto crítico e independiente dentro de `/home` que requiriera una prueba adicional.

## Limpieza

Las carpetas temporales creadas durante las pruebas fueron eliminadas:

```text
/tmp/linuxpc-restauracion-dotfiles
/tmp/linuxpc-restauracion-etc
/tmp/linuxpc-prueba-hdd
```

El archivo restaurado `~/Downloads/topicos.zip` se conserva temporalmente.

## Resultado

Las pruebas demostraron recuperación utilizable de muestras representativas de:

- dotfiles;
- configuración de `/etc`;
- datos del HDD;
- datos relevantes de `/home`.

`P0-03` cumple su criterio de finalización.
