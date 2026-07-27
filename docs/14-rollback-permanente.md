# Rollback permanente de Arch Linux

## Objetivo

Validar una restauración permanente y controlada de la raíz de Arch Linux mediante un snapshot de Snapper, conservando `/home`, los snapshots y una vía de reversión.

## Fecha

27 de julio de 2026.

## Estructura relevante

Arch utiliza Btrfs con estos subvolúmenes:

```text
@          → /
@home      → /home
@snapshots → /.snapshots
```

El arranque utiliza explícitamente:

```text
rootflags=subvol=@
```

La entrada de `/etc/fstab` también monta la raíz mediante:

```text
subvol=/@
```

Por este motivo no se utilizó directamente `snapper rollback`, ya que cambiar solamente el subvolumen predeterminado de Btrfs no habría modificado la ruta `@` solicitada por GRUB y `fstab`.

## Snapshot de seguridad

Antes de comenzar se creó:

```text
64 │ Antes de P0-04 rollback permanente
```

Después de crear el snapshot se añadió una marca al sistema activo:

```text
/etc/p0-04-rollback-prueba
```

Contenido:

```text
Creado después del snapshot 64
```

La ausencia posterior de este archivo permitió comprobar que la restauración retrocedió realmente al estado del snapshot.

## Preparación de la raíz restaurada

Se montó el nivel superior de Btrfs:

```bash
sudo mkdir -p /mnt/btrfs-root
sudo mount -o subvolid=5 /dev/nvme0n1p8 /mnt/btrfs-root
```

Se creó una copia escribible del snapshot `64`:

```bash
sudo btrfs subvolume snapshot \
  /mnt/btrfs-root/@snapshots/64/snapshot \
  /mnt/btrfs-root/@rollback-p0-04
```

Se verificó:

```text
ro=false
ROLLBACK_PREPARADO_OK
```

También se confirmó la existencia de:

```text
boot/vmlinuz-linux
boot/initramfs-linux.img
```

## Cambio permanente de raíz

La raíz activa se conservó con otro nombre:

```text
@ → @antes-p0-04
```

La copia restaurada pasó a utilizar el nombre esperado por GRUB y `fstab`:

```text
@rollback-p0-04 → @
```

El cambio se realizó mediante:

```bash
sudo bash -c '
set -euo pipefail
T=/mnt/btrfs-root

test -d "$T/@"
test -d "$T/@rollback-p0-04"
test ! -e "$T/@antes-p0-04"

mv "$T/@" "$T/@antes-p0-04"

if ! mv "$T/@rollback-p0-04" "$T/@"; then
  mv "$T/@antes-p0-04" "$T/@"
  echo "ERROR: cambio revertido" >&2
  exit 1
fi

sync
echo "CAMBIO_DE_RAIZ_PREPARADO"
'
```

Resultado:

```text
CAMBIO_DE_RAIZ_PREPARADO
```

Antes de reiniciar se confirmó la estructura:

```text
@
@antes-p0-04
@home
@snapshots
```

## Reinicio y validación

Se desmontó el acceso temporal y se reinició:

```bash
sudo umount /mnt/btrfs-root
sudo reboot
```

En GRUB se seleccionó la entrada normal de Arch Linux.

La raíz arrancó desde:

```text
/dev/nvme0n1p8[/@]
```

La marca creada después del snapshot ya no existía:

```text
ROLLBACK_PERMANENTE_OK
```

Esto demostró que el sistema arrancó permanentemente desde el estado restaurado.

## Comprobaciones posteriores

### `/home`

El directorio personal permaneció montado desde su subvolumen separado:

```text
/dev/nvme0n1p8[/@home]
```

El repositorio `~/linuxpc-dotfiles` permaneció intacto y sincronizado:

```text
## main...origin/main
f62f2c6 Marcar P0-03 como completado
```

### Snapper y GRUB

Los servicios continuaron activos:

```text
snapper-timeline.timer  → active
snapper-cleanup.timer   → active
grub-btrfsd.service     → active
```

El montaje de snapshots permaneció operativo:

```text
/.snapshots → /dev/nvme0n1p8[/@snapshots]
```

### Estado general

No se detectaron unidades fallidas:

```text
0 loaded units listed
```

### Vía de reversión

Se confirmó la existencia de:

```text
@antes-p0-04
```

La raíz anterior conservaba la marca de prueba:

```text
RAIZ_ANTERIOR_CONSERVADA_OK
```

Esto permite revertir manualmente el cambio si se detecta posteriormente algún problema.

## Snapshot posterior

Después de validar el sistema recuperado se creó:

```text
82 │ Después de P0-04 rollback permanente
```

## Estado actual

```text
@               → raíz restaurada y operativa
@antes-p0-04    → raíz anterior conservada temporalmente
@home           → datos personales intactos
@snapshots      → snapshots operativos
```

No debe eliminarse `@antes-p0-04` hasta completar un periodo razonable de uso y confirmar que no se necesita volver al estado anterior.

## Resultado

La prueba confirmó que:

- un snapshot de Snapper puede convertirse en una nueva raíz escribible;
- Arch puede arrancar permanentemente desde esa raíz;
- `/home` permanece intacto;
- Snapper y `grub-btrfsd` continúan funcionando;
- no quedan servicios fallidos;
- la raíz anterior puede conservarse como mecanismo de reversión.

`P0-04` cumple su criterio de finalización.