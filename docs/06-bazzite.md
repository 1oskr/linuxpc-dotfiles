# Bazzite

## Rol del sistema

Bazzite se utiliza como sistema dedicado principalmente a videojuegos.

También sirve para:

- Steam;
- emulación;
- pruebas de compatibilidad;
- uso de aplicaciones Flatpak;
- mantener separado el entorno gaming del sistema principal.

## Usuario

```text
oskrbzt
```

## Sistema de archivos

Partición principal:

```text
/dev/nvme0n1p7
```

UUID:

```text
9e94c88f-cc15-4af1-9d91-20530b508e1c
```

Sistema de archivos:

```text
Btrfs
```

Subvolúmenes principales:

```text
root
var
home
```

Puntos de montaje relevantes:

```text
root -> /
var  -> /var
home -> /var/home
```

## Particiones de arranque

### EFI

```text
/dev/nvme0n1p5
```

UUID:

```text
09A5-B5D0
```

Punto de montaje:

```text
/boot/efi
```

### Boot

```text
/dev/nvme0n1p6
```

UUID:

```text
c6e68ccc-1220-471e-9e08-eecbb2bcaa7a
```

Punto de montaje:

```text
/boot
```

## Integración con GRUB

Bazzite conserva su propia EFI.

Desde GRUB en Arch se utiliza una entrada personalizada que encadena:

```text
/EFI/fedora/grubx64.efi
```

## HDD compartido

Punto de montaje real:

```text
/var/mnt/hdd
```

Entrada en `/etc/fstab`:

```fstab
# HDD compartido (Arch / Bazzite / Windows) - Toshiba 1TB
UUID=0ADA2188DA2170DD /var/mnt/hdd ntfs3 defaults,uid=1000,gid=1000,noatime,nofail,x-systemd.device-timeout=5s 0 0
```

Verificación:

```bash
findmnt /var/mnt/hdd
```

## Visual Studio Code

Instalado mediante Flatpak:

```text
com.visualstudio.code
```

Verificación:

```bash
flatpak list | grep -i visual
```

Ejecución directa:

```bash
flatpak run com.visualstudio.code
```

Para abrir un archivo:

```bash
flatpak run com.visualstudio.code /ruta/al/archivo
```

## Shell

Shell actual:

```text
bash
```

Ruta real del directorio personal:

```text
/var/home/oskrbzt
```

Variable `HOME`:

```text
/home/oskrbzt
```

Esta diferencia es normal en Bazzite y no afecta el funcionamiento.

## Comandos de diagnóstico

```bash
lsblk -o NAME,SIZE,FSTYPE,LABEL,UUID,MOUNTPOINTS,MODEL
```

```bash
findmnt
```

```bash
findmnt /var/mnt/hdd
```

```bash
flatpak list
```

```bash
rpm-ostree status
```

## Precauciones

- No tratar Bazzite como una distribución tradicional mutable.
- Preferir Flatpak para aplicaciones gráficas.
- No modificar particiones EFI sin diagnóstico previo.
- Mantener `nofail` en el montaje del HDD.
- Verificar rutas reales bajo `/var`.
- No guardar información sensible en archivos versionados.