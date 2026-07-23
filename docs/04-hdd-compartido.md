# HDD compartido

## Objetivo

Usar un único HDD de datos accesible desde:

- Arch Linux;
- Bazzite;
- Windows 11.

## Disco

Modelo:

```text
TOSHIBA HDWD110
```

Capacidad aproximada:

```text
1 TB
```

Dispositivo:

```text
/dev/sda
```

Partición de datos:

```text
/dev/sda3
```

Etiqueta:

```text
oskr
```

UUID:

```text
0ADA2188DA2170DD
```

Sistema de archivos:

```text
NTFS
```

## Motivo para mantener NTFS

Se mantiene NTFS porque permite compartir el mismo contenido entre los tres sistemas sin duplicar datos.

Ventajas:

- compatibilidad nativa con Windows;
- soporte de lectura y escritura en Arch;
- soporte de lectura y escritura en Bazzite;
- rutas estables para aplicaciones y scripts.

## Montaje en Arch Linux

Punto de montaje:

```text
/mnt/hdd
```

Entrada en `/etc/fstab`:

```fstab
# HDD compartido (Arch / Bazzite / Windows) - Toshiba 1TB
UUID=0ADA2188DA2170DD /mnt/hdd ntfs3 defaults,uid=1000,gid=1000,noatime 0 0
```

Verificación:

```bash
findmnt /mnt/hdd
```

Resultado esperado:

```text
/dev/sda3 montado con ntfs3 en modo rw
```

## Montaje en Bazzite

Punto de montaje real:

```text
/var/mnt/hdd
```

Entrada en `/etc/fstab`:

```fstab
# HDD compartido (Arch / Bazzite / Windows) - Toshiba 1TB
UUID=0ADA2188DA2170DD /var/mnt/hdd ntfs3 defaults,uid=1000,gid=1000,noatime,nofail,x-systemd.device-timeout=5s 0 0
```

La opción `nofail` evita bloquear el arranque si el HDD está desconectado.

Verificación:

```bash
findmnt /var/mnt/hdd
```

## Validaciones realizadas

### Integridad NTFS

```bash
sudo ntfsfix --no-action /dev/sda3
```

Resultado:

- MFT correcta;
- MFTMirr correcta;
- sector de arranque alternativo correcto;
- volumen NTFS 3.1 procesado correctamente.

### Escritura desde Arch

Se creó y eliminó un archivo temporal en:

```text
/mnt/hdd
```

### Escritura desde Bazzite

Se creó y eliminó un archivo temporal en:

```text
/var/mnt/hdd
```

### Escritura desde Windows

Se creó un archivo desde Windows y se leyó correctamente desde Arch.

## Comandos de diagnóstico

```bash
lsblk -o NAME,SIZE,FSTYPE,LABEL,UUID,MOUNTPOINTS,MODEL
```

```bash
findmnt /dev/sda3
```

```bash
sudo dmesg | grep -Ei 'ntfs|sda3|write|read-only|ro'
```

```bash
sudo findmnt --verify
```

## Precauciones

- No usar `mkfs`, `wipefs`, `fdisk` ni `parted` sobre `/dev/sda`.
- No ejecutar `ntfsfix` sin necesidad.
- No desmontar el HDD mientras haya archivos abiertos.
- Mantener desactivado el inicio rápido de Windows.
- Usar siempre UUID en `/etc/fstab`.
- Verificar el montaje antes de copiar o borrar datos importantes.