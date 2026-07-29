# Inventario de configuración del sistema Arch

## Propósito y autoridad

Este documento registra la configuración relevante de Arch Linux que vive fuera
de los dotfiles del usuario. Describe el estado observado y separa las partes
que deben conservarse, documentarse o representarse posteriormente de las que
son generadas por el sistema.

La [matriz de fuente de verdad](15-matriz-fuente-de-verdad.md) conserva la
autoridad de las fuentes: el sistema autoriza el estado efectivo y el
repositorio autoriza el estado previsto. Los límites de pertenencia se definen
en [Límites de configuración](16-limites-configuracion.md). Este inventario no
copia archivos de `/etc`, no contiene secretos y no cambia la configuración
activa.

Fecha de observación: 29 de julio de 2026.

## Configuración persistente y canónica

Esta sección contiene únicamente configuración persistente, identidad estable y
decisiones de plataforma. Los estados de ejecución se registran por separado en
la evidencia de auditoría.

### Identidad del sistema

| Elemento | Estado observado | Fuente primaria | Representación prevista | Verificación | Proyecto |
|---|---|---|---|---|---|
| Hostname | `arch` | `/etc/hostname` y `hostnamectl` | Perfil específico de LinuxPC | `hostname`, `hostnamectl` y comparación con el perfil | P1-04 |
| Sistema operativo | Arch Linux rolling, x86-64 | `/etc/os-release` | Documentación | `cat /etc/os-release` | P1-04 |
| Locale y teclado | `es_CL.UTF-8`, `la-latin1`, `latam` | `localectl` | Documentación o configuración del sistema | `localectl` | P1-07 |
| Zona horaria | `America/Santiago` | `timedatectl` | Documentación | `timedatectl` | P1-07 |

El hostname canónico del proyecto es `arch`. La referencia histórica `arklinuk`
se conserva únicamente cuando describe una decisión o evidencia anterior; no
debe utilizarse para describir el estado actual.

### Almacenamiento y Btrfs

El detalle arquitectónico de particiones y sistemas de archivos permanece en
[Particiones y sistemas de archivos](02-particiones.md), y el del HDD
compartido en [HDD compartido](04-hdd-compartido.md). Este documento conserva
solo la relación inventariable con la configuración del sistema.

#### Subvolúmenes del esquema persistente

| Subvolumen | ID | Uso persistente |
|---|---:|---|
| `@` | 328 | Raíz de Arch, montada en `/` |
| `@home` | 257 | Datos de usuario, montada en `/home` |
| `@snapshots` | 260 | Snapshots de Snapper, montada en `/.snapshots` |
| `@antes-p0-04` | 256 | Subvolumen existente; su propósito actual no se infiere de su nombre |

`/` corresponde a `@` y `/.snapshots` corresponde a `@snapshots`. El subvolumen
`@home` permanece separado de los snapshots de la raíz. No se elimina ni se
reclasifica `@antes-p0-04` desde este proyecto.

#### Montajes persistentes relevantes

La fuente primaria es `/etc/fstab`; el estado efectivo se verifica con
`findmnt`. La comprobación `sudo findmnt --verify --verbose` terminó sin
errores ni avisos.

| Dispositivo o UUID | Punto de montaje | Tipo y opciones relevantes | Tratamiento |
|---|---|---|---|
| UUID `05ee00f1-7c3f-49da-b747-4b9440f54e76`, subvolumen `@` | `/` | Btrfs, `noatime`, `compress=zstd:3`, `discard=async`, `space_cache=v2` | Conservar como configuración específica de LinuxPC |
| El mismo UUID, subvolumen `@home` | `/home` | Btrfs con las mismas opciones principales | Conservar como configuración específica de LinuxPC |
| UUID `05ee00f1-7c3f-49da-b747-4b9440f54e76`, subvolumen `@snapshots` | `/.snapshots` | Btrfs con las mismas opciones principales | Conservar y documentar con Snapper |
| UUID `C8AA-8DB4` | `/boot/efi` | VFAT, opciones de permisos y recuperación ante error | Conservar como configuración de arranque |
| UUID `0ADA2188DA2170DD` (`/dev/sda3`) | `/mnt/hdd` | NTFS3, `uid=1000`, `gid=1000`, `noatime` | Conservar; datos permanecen fuera del repositorio |

El contenido de `/boot` reside en la raíz Btrfs y la ESP separada está en
`/boot/efi`; el detalle de particiones se conserva en [Particiones y sistemas
de archivos](02-particiones.md).

### Snapper y rollback

La estrategia y el procedimiento de snapshots se conservan en
[Snapshots con Snapper](10-snapshots-snapper.md) y [Rollback permanente de Arch
Linux](14-rollback-permanente.md). La configuración persistente inventariada es:

- Snapper sobre la raíz `@`;
- `@snapshots` montado en `/.snapshots`;
- timeline y cleanup habilitados;
- `snap-pac` para snapshots alrededor de operaciones de Pacman;
- `grub-btrfsd` configurado para observar `/.snapshots`.

Los snapshots, enlaces de GRUB, `grub-btrfs.cfg` e initramfs son estado del
sistema o artefactos generados; no deben copiarse al repositorio como archivos
activos.

### Arranque y GRUB

La configuración mantenible se resume aquí; el procedimiento completo está en
[Arranque y GRUB](03-grub.md):

- `/etc/default/grub` define timeout de 15 segundos, `os-prober` habilitado y
  `nvidia_drm.modeset=1`;
- `/etc/grub.d/40_custom` contiene la entrada declarativa de Bazzite;
- `/boot/efi` usa la ESP principal de Arch y Windows;
- existe una ESP separada para Bazzite.

Las entradas generadas de GRUB pertenecen a la evidencia de auditoría, no a
esta representación canónica.

### Sudoers y privilegios

La política principal de sudo pertenece al sistema. No se copian sus archivos al
repositorio sin una revisión específica de seguridad.

### Servicios declarados

La habilitación y los enlaces efectivos pertenecen al sistema; esta tabla solo
registra unidades y componentes que deben existir o cuya decisión debe quedar
documentada.

| Unidad o componente | Ámbito | Representación relacionada | Seguimiento |
|---|---|---|---|
| `NetworkManager.service` | Sistema | Paquete y configuración del sistema | P1-07 |
| `sshd.service` | Sistema | Documentación de acceso remoto | P1-08 |
| `rustdesk.service` | Sistema | Paquete AUR y documentación | P1-08 |
| `grub-btrfsd.service` | Sistema | Snapper/GRUB | P1-07 |
| `snapper-timeline.timer` y `snapper-cleanup.timer` | Sistema | Snapper | P1-07 |
| Unidades NVIDIA de suspensión | Sistema | Integración del paquete NVIDIA | P1-10 |
| `snappy-switcher.service` | Usuario | Override versionado en `.config/systemd` | P1-09 |
| `wireplumber.service` y sockets PipeWire | Usuario | Proporcionados por paquetes | P1-07 |
| `hyprpaper.service` | Usuario | Autostart de Hyprland y unidad de usuario | P1-09 |
| `redshift.service` | Usuario | Alternativa instalada, pendiente de decisión | P1-07/P1-09 |
| Sunshine | Usuario | Paquete AUR y servicio generado | P1-08 |
| Hyprsunset, Matuwall, Waybar Hover y `lxpolkit` | Sesión Hyprland | `.config/hypr/modules/autostart.lua` | P1-09 |

### Configuración externa al repositorio

| Elemento | Estado | Decisión |
|---|---|---|
| `/etc/fstab` | Personalizado y válido | Incorporar posteriormente como archivo declarativo específico de máquina |
| `/etc/default/grub` y `40_custom` | Personalizados para el arranque | Incorporar posteriormente, excluyendo el GRUB generado |
| `/etc/mkinitcpio.conf` | Personalizado | Incorporar posteriormente junto con su procedimiento de regeneración |
| `/etc/default/grub-btrfs/config` | Configuración de paquete sin cambios locales relevantes | Documentar; no duplicar mientras siga estándar |
| `/etc/snapper/configs/root` | Válido, timeline y cleanup habilitados | Incorporar posteriormente tras decidir formato y permisos |
| `/etc/hostname` | `arch` | Incorporar posteriormente como perfil específico de LinuxPC |
| Perfiles de NetworkManager | Existen y pueden contener credenciales | Mantener fuera de Git; documentar solo existencia y recuperación |
| `/etc/systemd/system` y `/etc/systemd/user` | Enlaces generados y unidades de paquete | Inventariar nombres y estado, no copiar enlaces |
| `/etc/sudoers` y `/etc/sudoers.d` | Política efectiva; directorio local vacío | Mantener bajo control del sistema y documentar validación |

La estructura declarativa futura puede ubicarse bajo `system/arch/`, pero no se
crea en P1-04. No se copian archivos de `/etc`, secretos, perfiles de red,
`grub.cfg`, initramfs ni enlaces generados.

## Propietario y criticidad

| Dominio | Propietario de la fuente primaria | Criticidad | Motivo |
|---|---|---|---|
| Identidad y hostname | Oscar / sistema Arch | Alta | Determina la identidad del equipo y la coherencia de acceso |
| Btrfs, montajes y ESP | Oscar / sistema Arch | Crítica | Una modificación incorrecta puede impedir el arranque o el acceso a datos |
| Snapper y rollback | Oscar / Snapper | Crítica | Sostiene la recuperación de la raíz del sistema |
| GRUB y entradas UEFI | Oscar / firmware y GRUB | Crítica | Controla el arranque de Arch, Bazzite y Windows |
| Red y acceso remoto | Oscar / NetworkManager y systemd | Alta | Mantiene conectividad y administración remota |
| Servicios del sistema | Oscar / systemd | Alta | Define capacidades esenciales y su disponibilidad |
| Servicios de usuario y sesión | Oscar / systemd de usuario y Hyprland | Alta | Define el entorno gráfico operativo |
| Hardware y módulos | Oscar / kernel y controladores | Alta | Vincula la configuración con el hardware físico de LinuxPC |
| Sudoers y secretos | Oscar / sistema y almacenes privados | Crítica | Protege el control administrativo y material sensible |

La criticidad describe el impacto de pérdida o divergencia, no autoriza cambios
ni convierte el estado efectivo en configuración versionable.

## Evidencia observada durante la auditoría

La siguiente evidencia corresponde a la observación del 29 de julio de 2026 y
no constituye configuración canónica:

- Kernel observado: `7.1.5-arch1-1`.
- `/etc/sudoers.d/` estaba vacío y `visudo -cf /etc/sudoers` devolvió `parsed OK`.
- `sudo findmnt --verify --verbose` terminó sin errores ni avisos.
- GRUB contenía una entrada Windows asociada a `/dev/nvme0n1p1`, otra asociada a
  `/dev/sda1`, una entrada activa de Bazzite y el submenú `Arch Linux snapshots`.
- Las unidades de sistema no presentaban fallos.
- NetworkManager, SSH, RustDesk, grub-btrfsd y los timers de Snapper estaban
  habilitados y activos durante la observación.
- Snappy Switcher, WirePlumber y PipeWire estaban activos en la sesión de
  usuario.
- Redshift estaba habilitado pero fallido; Sunshine estaba habilitado pero
  inactivo; Hyprpaper estaba habilitado y su proceso era iniciado también por
  el autostart de Hyprland.
- Hyprsunset, Matuwall, Waybar Hover y `lxpolkit` estaban ejecutándose en la
  sesión Hyprland.
- `@antes-p0-04` estaba presente; su finalidad no se infiere de su nombre.

Estos datos sirven para diagnóstico y para contrastar la configuración
declarada. Deben actualizarse o retirarse cuando cambie el sistema.

## Discrepancias, riesgos y pendientes

- Las referencias actuales al hostname deben usar `arch`; solo las referencias
  históricas pueden conservar `arklinuk` con contexto explícito.
- Las entradas Windows requieren validación en P1-06 antes de cualquier cambio.
- Redshift/Hyprsunset y la doble activación de Hyprpaper requieren una decisión
  de ciclo de sesión en P1-07/P1-09.
- Sunshine y RustDesk presentan un estado efectivo distinto del flujo remoto
  descrito; corresponde a P1-08.
- El hardware NVIDIA, los monitores y el parámetro de kernel deben consolidarse
  en el perfil físico de P1-10.
- Las habilitaciones systemd, los montajes efectivos y el entorno de sesión no
  deben confundirse con archivos declarativos versionables.
- La automatización de despliegue y generación de enlaces queda para P2-01.

## Fuente canónica futura

La documentación de dominio será `docs/18-inventario-configuracion-sistema.md`.
Cuando corresponda implementar la representación procesable, se propone:

```text
system/arch/
├── hostname
├── fstab
├── services-system.txt
├── services-user.txt
├── timers.txt
├── etc-files.txt
└── dotfiles-links.txt
```

Estos archivos representarían estado previsto. El sistema seguiría siendo la
fuente primaria del estado efectivo; archivos generados, secretos y datos
temporales permanecerían fuera de Git.

## Resultado de P1-04

El estado relevante fuera de los dotfiles está identificado, clasificado y
asignado a una fuente primaria, un propietario y un proyecto responsable. Se
confirmaron el hostname `arch`, el esquema Btrfs, los montajes persistentes,
Snapper, GRUB, sudoers y las unidades relevantes. Las incertidumbres restantes
son decisiones posteriores de P1-06, P1-07, P1-08, P1-09, P1-10 y P2-01; no
bloquean el inventario documental.
