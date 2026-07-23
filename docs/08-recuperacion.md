# Recuperación del sistema

## Objetivo

Registrar los procedimientos mínimos para diagnosticar y recuperar:

- GRUB;
- Arch Linux;
- Bazzite;
- el HDD compartido;
- los dotfiles.

## Recuperación de GRUB desde Arch ISO

### 1. Identificar particiones

```bash
lsblk -o NAME,SIZE,FSTYPE,LABEL,UUID,MOUNTPOINTS
```

Particiones relevantes:

```text
/dev/nvme0n1p1 -> EFI principal
/dev/nvme0n1p8 -> Arch Linux
```

### 2. Montar Arch

```bash
mount -o subvol=@ /dev/nvme0n1p8 /mnt
mount --mkdir /dev/nvme0n1p1 /mnt/boot/efi
mount -o subvol=@home /dev/nvme0n1p8 /mnt/home
```

### 3. Entrar al sistema

```bash
arch-chroot /mnt
```

### 4. Reinstalar GRUB

```bash
grub-install \
  --target=x86_64-efi \
  --efi-directory=/boot/efi \
  --bootloader-id=GRUB \
  --recheck
```

### 5. Regenerar configuración

```bash
grub-mkconfig -o /boot/grub/grub.cfg
```

### 6. Salir y desmontar

```bash
exit
umount -R /mnt
reboot
```

## Diagnóstico de arranque

### Entradas UEFI

```bash
sudo efibootmgr -v
```

### Configuración de GRUB

```bash
grep -E 'GRUB_TIMEOUT|GRUB_DISABLE_OS_PROBER' /etc/default/grub
```

### Entrada de Bazzite

```bash
cat /etc/grub.d/40_custom
```

## Recuperación del HDD compartido

### Verificar detección

```bash
lsblk -o NAME,SIZE,FSTYPE,LABEL,UUID,MOUNTPOINTS,MODEL
```

### Verificar montaje

Arch:

```bash
findmnt /mnt/hdd
```

Bazzite:

```bash
findmnt /var/mnt/hdd
```

### Verificar integridad sin modificar

```bash
sudo ntfsfix --no-action /dev/sda3
```

### Revisar mensajes del kernel

```bash
sudo dmesg | grep -Ei 'ntfs|sda3|write|read-only|ro'
```

### Desmontar de forma segura

Arch:

```bash
sudo umount /mnt/hdd
```

Bazzite:

```bash
sudo umount /var/mnt/hdd
```

## Recuperación de dotfiles

### Clonar repositorio

```bash
git clone git@github.com:1oskr/linuxpc-dotfiles.git ~/linuxpc-dotfiles
```

### Revisar contenido

```bash
cd ~/linuxpc-dotfiles
git status
git log --oneline --decorate -10
```

### Restaurar archivos manualmente

Ejemplo:

```bash
cp ~/linuxpc-dotfiles/.zshrc ~/.zshrc
cp ~/linuxpc-dotfiles/.local/bin/Apagar ~/.local/bin/Apagar
chmod +x ~/.local/bin/Apagar
```

### Restaurar configuraciones con enlaces simbólicos

Ejemplo para Hyprland:

```bash
mv ~/.config/hypr ~/.config/hypr.backup
ln -s ~/linuxpc-dotfiles/.config/hypr ~/.config/hypr
```

## Recuperación ante errores en `/etc/fstab`

### Verificar sintaxis

```bash
sudo findmnt --verify
```

### Recargar systemd

```bash
sudo systemctl daemon-reload
```

### Probar montajes

```bash
sudo mount -a
```

### Si el sistema entra en modo de emergencia

Editar `/etc/fstab`, comentar la línea problemática y volver a ejecutar:

```bash
sudo systemctl daemon-reload
sudo mount -a
```

## Precauciones

- No ejecutar `mkfs`, `wipefs`, `fdisk` ni `parted` sin identificar el disco exacto.
- No usar `git reset --hard` sin respaldo.
- No modificar entradas EFI sin revisar antes `efibootmgr -v`.
- No usar `ntfsfix` como sustituto de `chkdsk`.
- No reparar Btrfs sin diagnóstico previo.
- No desmontar particiones con archivos abiertos.

## Respaldo manual de `/etc`

Respaldo creado:

```text
/mnt/hdd/Backups/etc/etc-2026-07-23-0600.tar.gz
```

Verificaciones realizadas:

- listado interno con `tar -tzf`;
- checksum SHA-256;
- resultado: respaldo íntegro.

Checksum:

```text
a6ec126acc44d5e886f8652d4b13069c7f9399c4a482ef6fed9612d9ec70ad23
```

Advertencia:

- el respaldo puede contener configuraciones sensibles;
- no debe subirse a GitHub;
- los sockets temporales de GnuPG fueron omitidos por `tar`, lo cual es normal.

## Prueba de recuperación de dotfiles

Se realizó una clonación limpia del repositorio en una carpeta temporal:

```text
/tmp/linuxpc-dotfiles-test
```

Comandos usados:

```bash
rm -rf /tmp/linuxpc-dotfiles-test
git clone git@github.com:1oskr/linuxpc-dotfiles.git /tmp/linuxpc-dotfiles-test
git -C /tmp/linuxpc-dotfiles-test status
git -C /tmp/linuxpc-dotfiles-test log -1 --oneline
```

Resultado:

- clonación completada correctamente;
- rama `main` sincronizada con `origin/main`;
- árbol de trabajo limpio;
- último commit verificado: `6cfc2d9`.
