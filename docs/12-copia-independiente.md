# Copia independiente de datos críticos

## Resultado

El 25 de julio de 2026 se creó una copia independiente de los datos críticos de LinuxPC en:

```text
Google Drive/Backup LinuxPC
```

El destino está fuera del equipo y sobrevive a la pérdida completa del SSD y del HDD locales.

## Datos respaldados

| Conjunto | Ubicación | Estado |
| --- | --- | --- |
| Carrera y Trabajo | `/mnt/hdd/Carrera y Trabajo` | Copia presente en Google Drive |
| cosasmias_windows | `/mnt/hdd/cosasmias_windows` | Copia presente en Google Drive |
| roms ps2 | `/mnt/hdd/roms ps2` | Copia presente en Google Drive |
| Respaldo de `/etc` cifrado | `/mnt/hdd/Backups/etc/etc-2026-07-23-0600.tar.gz.age` | Copia presente en Google Drive |

## Protección del respaldo de `/etc`

El respaldo fue cifrado mediante `age` con contraseña antes de subirlo.

La restauración fue verificada localmente mediante descifrado y comparación byte a byte con el archivo original.

Resultado de la comprobación:

```text
VERIFICACION_OK
```

El archivo sin cifrar no fue subido a Google Drive.

## Copias independientes adicionales

- Dotfiles: GitHub.
- Firefox: Firefox Sync.
- VS Code: Settings Sync mediante GitHub.

## Limitaciones

- La sincronización con Google Drive es manual.
- Aún falta realizar una restauración completa desde Google Drive.
- Esa prueba corresponde al proyecto `P0-03`.

## Estado

Cada conjunto de datos crítico dispone actualmente de al menos una copia independiente identificable.