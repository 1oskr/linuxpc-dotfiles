# Arquitectura del equipo

## Objetivo

Mantener tres sistemas operativos en un único equipo, cada uno con una función definida:

- **Arch Linux:** sistema principal.
- **Bazzite:** videojuegos.
- **Windows 11:** compatibilidad.

## Hardware de almacenamiento

### SSD NVMe

**Modelo:**

```text
KINGSTON SNV2S1000G
```

**Capacidad aproximada:**

```text
1 TB
```

Contiene:

- Windows 11.
- Arch Linux.
- Bazzite.
- Particiones EFI.
- Particiones de recuperación.

### HDD SATA

**Modelo:**

```text
TOSHIBA HDWD110
```

**Capacidad aproximada:**

```text
1 TB
```

**Uso:**

- almacenamiento compartido;
- documentos;
- universidad y trabajo;
- juegos y ROMs;
- copias de seguridad;
- recuperación de archivos de Windows.

**Sistema de archivos principal:**

```text
NTFS
```

## Gestor de arranque

Se utiliza:

```text
GRUB
```

GRUB está instalado desde Arch Linux y actúa como gestor principal.

Entradas disponibles:

- Arch Linux.
- Windows Boot Manager.
- Bazzite.
- UEFI Firmware Settings.

## Decisiones principales

- Arch Linux arranca por defecto.
- GRUB tiene un tiempo de espera de 15 segundos.
- Windows y Arch comparten la EFI principal.
- Bazzite mantiene su propia EFI.
- Bazzite se inicia mediante una entrada personalizada de GRUB.
- El HDD permanece en NTFS para poder compartir datos entre los tres sistemas.
