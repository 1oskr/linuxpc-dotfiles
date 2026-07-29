# Mapa de datos y objetivos de recuperación

## Objetivo

Identificar los conjuntos de datos de LinuxPC, su propietario, criticidad, ubicación y objetivos de recuperación.

La autoridad de los datos activos, sus respaldos y el material sensible se
define en la [matriz de fuente de verdad](15-matriz-fuente-de-verdad.md).

## Definiciones

- **RPO:** pérdida máxima de cambios aceptable.
- **RTO:** tiempo máximo previsto para recuperar acceso utilizable.
- **Copia independiente:** copia que sobrevive a la pérdida completa del equipo.

## Datos personales y académicos

| Conjunto | Propietario | Criticidad | Ubicación principal | Copia externa declarada | RPO | RTO |
|---|---|---:|---|---|---|---|
| Carrera y Trabajo | Oscar | Crítica | `/mnt/hdd/Carrera y Trabajo` | Google Drive; copia presente según [P0-02](12-copia-independiente.md) | Semanal durante el semestre y después de cambios importantes | 24 horas |
| cosasmias_windows | Oscar | Alta | `/mnt/hdd/cosasmias_windows` | Google Drive; copia presente según [P0-02](12-copia-independiente.md) | Después de cada modificación intencional | 3 días |
| roms ps2 | Oscar | Baja | `/mnt/hdd/roms ps2` | Google Drive; copia presente según [P0-02](12-copia-independiente.md) | Copia manual cuando cambie | Sin compromiso estricto |

### Estado local registrado

| Conjunto | Tamaño | Archivos | Carpetas |
|---|---:|---:|---:|
| Carrera y Trabajo | 72 GB | 51.720 | 5.427 |
| cosasmias_windows | 13 GB | 20.439 | 189 |
| roms ps2 | 21 MB | 14 | 2 |

### Contenido principal registrado

`Carrera y Trabajo` contiene:

- `Game Theory`;
- `Ing Civil Matemática`;
- `Proyectos`;
- `material apuntes Julio`;
- `Apunte_de_Problemas.pdf`;
- archivos ZIP auxiliares.

`cosasmias_windows` contiene:

- `archivos recuperados`;
- `docs`;
- `oskrthings`;
- `topicos`.

`roms ps2` contiene:

- `ps2-bios-all-bios`.

Dentro de `Carrera y Trabajo`, `Ing Civil Matemática` representa el conjunto de máxima importancia académica. `Proyectos` también contiene información importante y no regenerable. Parte del material auxiliar y algunos videos fueron considerados prescindibles durante la selección previa a la subida.

## Configuración y estado de usuario

| Conjunto | Propietario | Criticidad | Ubicación principal | Recuperación | RPO | RTO |
|---|---|---:|---|---|---|---|
| Dotfiles | Oscar | Alta | `~/linuxpc-dotfiles` | GitHub | Después de cada cambio confirmado | 24 horas |
| Firefox | Oscar | Media | `~/.mozilla/firefox` | Firefox Sync activado | Última sincronización | 24 horas |
| VS Code | Oscar | Media | `~/.config/Code/User` | Settings Sync mediante GitHub | Última sincronización | 24 horas |
| Claves y configuración SSH | Oscar | Alta y sensible | `~/.ssh` | Regenerar y volver a autorizar si se pierden | No aplicable a la clave privada actual | 24 horas |
| Configuración general de usuario | Oscar | Media | `~/.config` | Dotfiles, sincronización de aplicaciones o reconstrucción manual | Según cada aplicación | 1–3 días |

La clave privada `~/.ssh/id_ed25519_github` no debe almacenarse en GitHub ni subirse sin cifrado.

## Recuperación del sistema

| Conjunto | Propietario | Criticidad | Ubicación | Estado | RTO |
|---|---|---:|---|---|---|
| Snapshots de Arch | Oscar | Alta | SSD interno | Snapper, snap-pac y grub-btrfs configurados | Horas |
| Respaldo de `/etc` | Oscar | Alta | `/mnt/hdd/Backups/etc` | Archivo verificado mediante SHA-256, pero dentro del mismo equipo | 24 horas |
| Perfiles Firefox locales de respaldo | Oscar | Media | `~/Backups` y `~/.mozilla/firefox` | Copias locales; no constituyen respaldo independiente | 24 horas |
| Configuración de arranque y particiones | Oscar | Alta | Sistema y documentación del repositorio | Documentada parcialmente | 1 día |

Los snapshots, el HDD interno y las copias ubicadas dentro del mismo equipo no sustituyen una copia independiente.

## Datos prescindibles o regenerables

| Conjunto | Ubicación aproximada | Tratamiento |
|---|---|---|
| Juegos instalados | `/mnt/hdd/Juegos` | Reinstalar o descargar nuevamente |
| ISOs de Arch, Bazzite y Windows | `~/Desktop`, `~/Descargas`, `~/Downloads` | Descargar nuevamente |
| recuperacion-windows | `/mnt/hdd/recuperacion-windows` | Prescindible según decisión actual; revisar antes de eliminar |
| Cachés de Discord, VS Code y otras aplicaciones | `~/.config` | Regenerables |
| Material auxiliar descartado y videos prescindibles | HDD compartido | Sin objetivo de recuperación |

## Riesgos y limitaciones

- La restauración desde Google Drive se verificó sobre una muestra representativa; no se probó individualmente cada archivo respaldado.
- Las modificaciones realizadas antes de la subida hacen que los conteos locales no necesariamente coincidan con versiones anteriores.
- Google Drive actualmente se utiliza mediante subida manual, no como sincronización automática.
- Las claves SSH y otras credenciales requieren un procedimiento seguro separado.
- El respaldo de `/etc` y los snapshots no sobreviven a la pérdida completa del equipo.
- Antes de eliminar información local debe comprobarse que la copia vigente satisface el RPO correspondiente.

## Resultado de P0-01

Todos los conjuntos conocidos tienen propietario, criticidad, ubicación y objetivo de recuperación definidos. Las copias independientes y la prueba de restauración representativa se completaron posteriormente en `P0-02` y `P0-03`.
