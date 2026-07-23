# Documentación LinuxPC

Registro técnico del diseño, instalación, configuración, mantenimiento y recuperación del equipo.

## Estado actual

- Arch Linux como sistema principal.
- Bazzite como sistema dedicado a videojuegos.
- Windows 11 para compatibilidad.
- GRUB como gestor de arranque principal.
- Arch y Bazzite usan Btrfs.
- HDD NTFS compartido entre los tres sistemas.
- Dotfiles respaldados mediante Git y GitHub.

## Documentos

1. [Arquitectura del equipo](01-arquitectura.md)
2. [Particiones y sistemas de archivos](02-particiones.md)
3. [Arranque y GRUB](03-grub.md)
4. [HDD compartido](04-hdd-compartido.md)
5. [Arch Linux](05-arch-linux.md)
6. [Bazzite](06-bazzite.md)
7. [Dotfiles y Git](07-dotfiles-git.md)
8. [Recuperación del sistema](08-recuperacion.md)
9. [Roadmap](09-roadmap.md)

## Principios

- Cada modificación importante debe quedar documentada.
- Toda configuración importante debe mantenerse en Git.
- Los cambios deben ser reversibles.
- La estabilidad tiene prioridad sobre la estética.
- No deben almacenarse contraseñas, claves privadas ni información sensible.