# Particiones y sistemas de archivos

## SSD NVMe

Dispositivo:

```text
/dev/nvme0n1
```

Modelo:

```text
KINGSTON SNV2S1000G
```

Capacidad aproximada:

```text
1 TB
```

## Tabla de particiones

| Partición | Tamaño | Sistema de archivos | Uso |
|---|---:|---|---|
| `/dev/nvme0n1p1` | 1 GB | FAT32 | EFI principal de Arch y Windows |
| `/dev/nvme0n1p2` | 16 MB | Reservada | Microsoft Reserved Partition |
| `/dev/nvme0n1p3` | 219,1 GB | NTFS | Windows 11 |
| `/dev/nvme0n1p4` | 858 MB | NTFS | Recuperación de Windows |
| `/dev/nvme0n1p5` | 512 MB | FAT32 | EFI de Bazzite |
| `/dev/nvme0n1p6` | 2 GB | ext4 | `/boot` de Bazzite |
| `/dev/nvme0n1p7` | 97,5 GB | Btrfs | Sistema Bazzite |
| `/dev/nvme0n1p8` | 610,5 GB | Btrfs | Sistema Arch Linux |

## Arch Linux

Partición:

```text
/dev/nvme0n1p8
```

UUID:

```text
05ee00f1-7c3f-49da-b747-4b9440f54e76
```

Sistema de archivos:

```text
Btrfs
```

Subvolúmenes principales:

```text
@
@home
@/var/lib/portables
@/var/lib/machines
```

Puntos de montaje:

```text
@      -> /
@home  -> /home
```

Opciones principales:

```text
noatime
compress=zstd:3
discard=async
space_cache=v2
```

## Bazzite

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

Puntos de montaje:

```text
root -> /
var  -> /var
home -> /var/home
```

## HDD compartido

Dispositivo:

```text
/dev/sda
```

Modelo:

```text
TOSHIBA HDWD110
```

Partición de datos:

```text
/dev/sda3
```

UUID:

```text
0ADA2188DA2170DD
```

Sistema de archivos:

```text
NTFS
```

Montaje en Arch Linux:

```text
/mnt/hdd
```

Montaje en Bazzite:

```text
/var/mnt/hdd
```

## Decisiones

- Mantener el HDD en NTFS para compatibilidad entre Arch, Bazzite y Windows.
- Usar UUID en `/etc/fstab` en lugar de nombres como `/dev/sda3`.
- No modificar ni formatear las particiones EFI o de recuperación.
- Mantener separadas la EFI principal y la EFI de Bazzite.