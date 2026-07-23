# Arranque y GRUB

## Gestor principal

El gestor de arranque principal del equipo es:

```text
GRUB
```

Está instalado desde Arch Linux y controla el inicio de:

- Arch Linux.
- Windows 11.
- Bazzite.
- UEFI Firmware Settings.

## Configuración principal

Archivo:

```text
/etc/default/grub
```

Opciones relevantes:

```text
GRUB_TIMEOUT=15
GRUB_DISABLE_OS_PROBER=false
```

Arch Linux arranca por defecto.

## EFI principal

Partición:

```text
/dev/nvme0n1p1
```

UUID:

```text
C8AA-8DB4
```

Punto de montaje en Arch:

```text
/boot/efi
```

Esta EFI contiene las entradas de Arch y Windows.

## EFI de Bazzite

Partición:

```text
/dev/nvme0n1p5
```

UUID:

```text
09A5-B5D0
```

Bazzite mantiene su propia EFI.

## Entrada personalizada de Bazzite

Archivo:

```text
/etc/grub.d/40_custom
```

Contenido relevante:

```grub
menuentry "Bazzite" {
    insmod part_gpt
    insmod fat
    search --no-floppy --fs-uuid --set=root 09A5-B5D0
    chainloader /EFI/fedora/grubx64.efi
}
```

Esta entrada encadena el GRUB propio de Bazzite.

## Regenerar configuración

Después de modificar GRUB:

```bash
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

## Reparación desde Arch ISO

Montaje previo del sistema y entrada con `arch-chroot` requeridos.

Comandos principales:

```bash
grub-install \
  --target=x86_64-efi \
  --efi-directory=/boot/efi \
  --bootloader-id=GRUB \
  --recheck

grub-mkconfig -o /boot/grub/grub.cfg
```

## Comandos de diagnóstico

```bash
sudo efibootmgr -v
```

```bash
lsblk -o NAME,SIZE,FSTYPE,LABEL,UUID,MOUNTPOINTS,MODEL
```

```bash
grep -E 'GRUB_TIMEOUT|GRUB_DISABLE_OS_PROBER' /etc/default/grub
```

## Decisiones

- Mantener GRUB como gestor principal.
- No usar el menú de arranque de la placa salvo emergencia.
- Mantener separadas la EFI principal y la EFI de Bazzite.
- Regenerar `grub.cfg` después de cualquier cambio.
- No modificar entradas EFI sin revisar antes `efibootmgr -v`.
