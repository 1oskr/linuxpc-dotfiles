# Snapshots con Snapper

## Objetivo

Configurar snapshots automáticos de Arch Linux usando:

- Btrfs
- Snapper
- `snap-pac`
- `grub-btrfs`
- `inotify-tools`

Los snapshots cubren el subvolumen raíz `@`.

El directorio `/home` utiliza el subvolumen separado `@home`, por lo que no está incluido en los snapshots del sistema.

---

## Paquetes instalados

```bash
sudo pacman -S snapper btrfs-assistant snap-pac grub-btrfs inotify-tools
```

Funciones:

- `snapper`: creación y gestión de snapshots.
- `btrfs-assistant`: interfaz gráfica opcional.
- `snap-pac`: crea snapshots antes y después de operaciones de `pacman`.
- `grub-btrfs`: agrega los snapshots al menú de GRUB.
- `inotify-tools`: permite que `grub-btrfsd` detecte cambios en `/.snapshots`.

---

## Estructura Btrfs

Partición de Arch Linux:

```text
/dev/nvme0n1p8
UUID=05ee00f1-7c3f-49da-b747-4b9440f54e76
```

Subvolúmenes principales:

```text
@
@home
@snapshots
```

Montajes:

```text
@          → /
@home      → /home
@snapshots → /.snapshots
```

El subvolumen `@snapshots` está ubicado en el nivel superior del sistema de archivos Btrfs y no dentro del subvolumen `@`.

---

## Configuración de `/etc/fstab`

Entrada agregada:

```fstab
# Snapshots de Snapper
UUID=05ee00f1-7c3f-49da-b747-4b9440f54e76 /.snapshots btrfs rw,noatime,compress=zstd:3,ssd,discard=async,space_cache=v2,subvol=@snapshots 0 0
```

Verificar la sintaxis de `fstab`:

```bash
sudo findmnt --verify --verbose
```

Verificar el montaje:

```bash
findmnt /.snapshots
```

Origen esperado:

```text
/dev/nvme0n1p8[/@snapshots]
```

---

## Configuración inicial de Snapper

Crear la configuración para el sistema raíz:

```bash
sudo snapper -c root create-config /
```

Archivo de configuración:

```text
/etc/snapper/configs/root
```

Configuración utilizada:

```ini
SUBVOLUME="/"
FSTYPE="btrfs"

QGROUP=""

SPACE_LIMIT="0.5"
FREE_LIMIT="0.2"

ALLOW_USERS=""
ALLOW_GROUPS=""
SYNC_ACL="no"

BACKGROUND_COMPARISON="yes"

NUMBER_CLEANUP="yes"
NUMBER_MIN_AGE="3600"
NUMBER_LIMIT="10"
NUMBER_LIMIT_IMPORTANT="5"

TIMELINE_CREATE="yes"
TIMELINE_CLEANUP="yes"
TIMELINE_MIN_AGE="3600"

TIMELINE_LIMIT_HOURLY="5"
TIMELINE_LIMIT_DAILY="7"
TIMELINE_LIMIT_WEEKLY="4"
TIMELINE_LIMIT_MONTHLY="6"
TIMELINE_LIMIT_QUARTERLY="0"
TIMELINE_LIMIT_YEARLY="0"

EMPTY_PRE_POST_CLEANUP="yes"
EMPTY_PRE_POST_MIN_AGE="3600"
```

Verificar la configuración:

```bash
sudo snapper -c root get-config
```

---

## Subvolumen separado para snapshots

Inicialmente, Snapper creó:

```text
@/.snapshots
```

Se movió al nivel superior de Btrfs:

```text
@snapshots
```

Montaje final:

```text
@snapshots → /.snapshots
```

Para acceder temporalmente al nivel superior de Btrfs:

```bash
sudo mkdir -p /mnt/btrfs-root
sudo mount -o subvolid=5 /dev/nvme0n1p8 /mnt/btrfs-root
```

Mover el subvolumen:

```bash
sudo mv /mnt/btrfs-root/@/.snapshots /mnt/btrfs-root/@snapshots
```

Crear el punto de montaje:

```bash
sudo mkdir -p /.snapshots
```

Después de agregar la entrada correspondiente en `/etc/fstab`:

```bash
sudo systemctl daemon-reload
sudo mount /.snapshots
```

Verificar:

```bash
findmnt /.snapshots
sudo btrfs subvolume show /.snapshots
```

Desmontar el acceso temporal:

```bash
sudo umount /mnt/btrfs-root
sudo rmdir /mnt/btrfs-root
```

---

## Snapshots automáticos por tiempo

Activar el temporizador de snapshots:

```bash
sudo systemctl enable --now snapper-timeline.timer
```

Activar la limpieza automática:

```bash
sudo systemctl enable --now snapper-cleanup.timer
```

Verificar ambos temporizadores:

```bash
systemctl list-timers --all | grep snapper
```

Servicios esperados:

```text
snapper-timeline.timer
snapper-cleanup.timer
```

Verificar sus estados:

```bash
systemctl is-active snapper-timeline.timer
systemctl is-active snapper-cleanup.timer
```

Salida esperada:

```text
active
active
```

---

## Snapshots manuales

Crear un snapshot manual:

```bash
sudo snapper -c root create --description "Descripción del snapshot"
```

Listar snapshots:

```bash
sudo snapper -c root list
```

Eliminar un snapshot:

```bash
sudo snapper -c root delete NUMERO
```

Ejemplo:

```bash
sudo snapper -c root delete 11
```

---

## Integración con `pacman`

El paquete `snap-pac` crea snapshots automáticamente antes y después de operaciones de `pacman`.

Hooks instalados:

```text
/usr/share/libalpm/hooks/05-snap-pac-pre.hook
/usr/share/libalpm/hooks/10-snap-pac-removal.hook
/usr/share/libalpm/hooks/zz-snap-pac-post.hook
```

Verificarlos:

```bash
ls -l /usr/share/libalpm/hooks/*snap-pac*
```

Ejemplo de snapshots generados:

```text
pre  │ pacman -S paquete
post │ paquete
```

Comprobarlos:

```bash
sudo snapper -c root list
```

Ejemplo real:

```text
7 │ pre  │ pacman -S grub-btrfs
8 │ post │ grub-btrfs
9 │ pre  │ pacman -S inotify-tools
10│ post │ inotify-tools
```

---

## Integración con GRUB

Generar la configuración principal de GRUB:

```bash
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

Durante la generación deben detectarse los snapshots:

```text
Detecting snapshots ...
Found snapshot: ...
```

Verificar el submenú:

```bash
sudo grep -nE "Snapshots|snapshot" /boot/grub/grub.cfg
```

Entrada esperada:

```text
Arch Linux snapshots
```

Contenido esperado dentro de `/boot/grub/grub.cfg`:

```text
submenu 'Arch Linux snapshots' {
    configfile "${prefix}/grub-btrfs.cfg"
}
```

Verificar las entradas reales:

```bash
sudo grep -nE "^menuentry|^submenu" /boot/grub/grub-btrfs.cfg
```

---

## Servicio `grub-btrfsd`

Activar el servicio:

```bash
sudo systemctl enable --now grub-btrfsd.service
```

Verificar su estado:

```bash
systemctl status grub-btrfsd.service --no-pager
```

Proceso esperado:

```text
/usr/bin/grub-btrfsd --syslog /.snapshots
```

También debe aparecer `inotifywait` vigilando:

```text
/.snapshots
```

Verificar procesos:

```bash
systemctl status grub-btrfsd.service --no-pager
```

Verificar registros:

```bash
journalctl -u grub-btrfsd.service -n 30 --no-pager
```

---

## Regenerar manualmente el menú de snapshots

Si `grub-btrfsd` no actualiza el menú después de eliminar un snapshot:

```bash
sudo /etc/grub.d/41_snapshots-btrfs
```

Verificar el archivo generado:

```bash
sudo grep -nE "^menuentry|^submenu" /boot/grub/grub-btrfs.cfg
```

No es necesario ejecutar `grub-mkconfig` completo para regenerar únicamente las entradas de snapshots.

---

## Uso desde GRUB

En el menú principal de GRUB aparece:

```text
Arch Linux snapshots
```

Dentro se muestran los snapshots disponibles con:

- fecha;
- ruta;
- tipo;
- descripción.

Ejemplo:

```text
2026-07-23 04:43:38 | @snapshots/10/snapshot | post | inotify-tools
```

Antes de realizar una restauración permanente:

1. iniciar el snapshot desde GRUB;
2. comprobar que el sistema arranca;
3. revisar que el estado sea el esperado;
4. realizar el rollback solo después de verificarlo.

No realizar un rollback permanente sin comprobar primero el snapshot.

---

## Verificación después de reiniciar

Ejecutar:

```bash
systemctl is-active snapper-timeline.timer snapper-cleanup.timer grub-btrfsd.service
findmnt /.snapshots
sudo snapper -c root list
```

Salida esperada de los servicios:

```text
active
active
active
```

Montaje esperado:

```text
/dev/nvme0n1p8[/@snapshots]
```

Verificar el menú de GRUB:

```bash
sudo grep -nE "^menuentry|^submenu" /boot/grub/grub-btrfs.cfg
```

---

## Estado final

Configuración validada:

- Snapper instalado y operativo.
- Subvolumen separado `@snapshots`.
- Montaje persistente en `/.snapshots`.
- Snapshots automáticos por tiempo habilitados.
- Limpieza automática habilitada.
- Límites de retención configurados.
- Snapshots `pre` y `post` de `pacman`.
- Integración con GRUB funcionando.
- Submenú `Arch Linux snapshots` visible durante el arranque.
- Actualización automática mediante `grub-btrfsd`.
- Servicios activos después de reiniciar.
- Snapshot de prueba eliminado correctamente.
- Snapshot automático `timeline` validado correctamente a las 05:00 mediante `snapper-timeline.timer`.