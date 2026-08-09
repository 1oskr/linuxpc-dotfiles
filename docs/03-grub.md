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

La recuperación del arranque multisistema se probó el 2026-08-08 desde un USB
Ventoy con `archlinux-2026.07.01-x86_64.iso`, iniciado correctamente en modo
UEFI.

Antes de reparar, se comprobó en solo lectura que la raíz Btrfs de Arch
(`/dev/nvme0n1p8`, subvolumen `@`) y la EFI principal
(`/dev/nvme0n1p1`, UUID `C8AA-8DB4`) podían montarse; también funcionaron
`arch-chroot /mnt` y `efibootmgr` dentro del chroot. Se verificó la presencia
de `/EFI/GRUB/grubx64.efi` y `/EFI/Microsoft/Boot/bootmgfw.efi` en la EFI
principal, y de `/EFI/fedora/grubx64.efi` en la EFI de Bazzite.

Antes de la reparación se creó el respaldo local
`/root/p1-06-grub-backup-20260808M`, con `GRUB/grubx64.efi`, `grub.cfg`,
`/etc/default/grub`, `/etc/grub.d/40_custom` y `efibootmgr-before.txt`.

Para reparar GRUB, montar previamente la raíz de Arch y la EFI principal en
modo de escritura y entrar con `arch-chroot`.

Comandos principales:

```bash
grub-install \
  --target=x86_64-efi \
  --efi-directory=/boot/efi \
  --bootloader-id=GRUB \
  --recheck

grub-mkconfig -o /boot/grub/grub.cfg
```

`grub-install` finalizó con `Installation finished. No error reported.` El
`grub.cfg` regenerado contiene Arch Linux, Windows Boot Manager en
`/dev/nvme0n1p1`, Windows Boot Manager antiguo en `/dev/sda1`, Bazzite y Arch
Linux snapshots.

No se modificó la EFI de Bazzite. Se conservaron las entradas UEFI relevantes
para GRUB, Windows principal, Fedora/Bazzite y Windows antiguo del HDD; el
orden de arranque no cambió de forma relevante. Tras retirar el USB, se
verificó el arranque desde el SSD de Arch Linux, Bazzite y Windows.

La prueba no valida la reparación de la EFI propia de Bazzite ni una
restauración desde el respaldo local; ambas quedaron fuera de su alcance.

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
