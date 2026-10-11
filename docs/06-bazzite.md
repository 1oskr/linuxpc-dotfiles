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

## Konsole

Konsole es la terminal principal prevista para Bazzite. Su apariencia fue
validada visualmente por el usuario.

El perfil utilizado es:

```text
~/.local/share/konsole/LinuxPC-Bazzite.profile
```

La copia reproducible del perfil se versiona en:

```text
.local/share/konsole/LinuxPC-Bazzite.profile
```

El esquema de color utilizado es:

```text
~/.local/share/konsole/LinuxPC-Bazzite-Catppuccin-Latte.colorscheme
```

La copia reproducible del esquema se versiona en:

```text
.local/share/konsole/LinuxPC-Bazzite-Catppuccin-Latte.colorscheme
```

El perfil predeterminado configurado en `~/.config/konsolerc` es:

```text
LinuxPC-Bazzite.profile
```

`~/.config/konsolerc` no se versiona completo porque también contiene estado y
preferencias globales de KDE. En una reconstrucción, después de instalar los
dos archivos versionados en `~/.local/share/konsole/`, se establece únicamente
la selección del perfil:

```bash
kwriteconfig6 \
  --file "$HOME/.config/konsolerc" \
  --group "Desktop Entry" \
  --key DefaultProfile \
  LinuxPC-Bazzite.profile
```

El perfil usa Google Sans Code a 11 pt, el esquema Catppuccin Latte, fondo
`#eff1f5`, texto `#5c5f77`, opacidad `1.0`, margen de 6 px, barra de
desplazamiento oculta, pestañas visibles solo cuando son necesarias, cursor
I-beam y `/bin/bash` como shell.

La visibilidad de pestañas se mantiene como ajuste local de KDE mediante
`TabBarVisibility=1` en `~/.config/konsolerc`; no forma parte del perfil
versionado mientras no exista una representación estable y comprobada dentro
de este.

La fuente Google Sans Code debe estar instalada en el sistema para reproducir
la apariencia validada.

La instalación y selección pueden verificarse con:

```bash
cp ~/linuxpc-dotfiles/.local/share/konsole/LinuxPC-Bazzite.profile \
  ~/.local/share/konsole/
cp ~/linuxpc-dotfiles/.local/share/konsole/LinuxPC-Bazzite-Catppuccin-Latte.colorscheme \
  ~/.local/share/konsole/
kwriteconfig6 \
  --file "$HOME/.config/konsolerc" \
  --group "Desktop Entry" \
  --key DefaultProfile \
  LinuxPC-Bazzite.profile
konsole --profile LinuxPC-Bazzite.profile
```

Prueba de ejecución:

```bash
konsole --profile LinuxPC-Bazzite.profile
```

## Kitty

Konsole es la terminal principal de Bazzite. `copysalida` fue retirado del
Bash de Bazzite y no se reemplazará por una captura automática en Konsole; la
copia manual de la última salida es suficiente.

Kitty fue eliminado localmente de Bazzite. No quedan instalados su aplicación,
binarios, lanzadores ni caché de usuario.

La configuración versionada de Kitty se conserva intacta porque Arch Linux la
sigue utilizando:

```text
~/linuxpc-dotfiles/.config/kitty/kitty.conf
```

La configuración habilita `allow_remote_control yes` para ese flujo de Arch.

## Stremio con VPN aislada

Stremio está instalado como Flatpak:

```text
com.stremio.Stremio
```

Vopono está instalado para el usuario mediante Cargo:

```text
~/.cargo/bin/vopono
```

El perfil WireGuard utilizado se encuentra en:

```text
~/.config/vopono/nl-ams-vopono.conf
```

La ejecución se realiza mediante el wrapper:

```text
~/.local/bin/stremio-vpn
```

El lanzador KDE está en:

```text
~/.local/share/applications/stremio-vpn.desktop
```

Comando de ejecución:

```bash
~/.cargo/bin/vopono exec --custom ~/.config/vopono/nl-ams-vopono.conf ~/.local/bin/stremio-vpn
```

Durante la verificación se observó el namespace `vo_c_Lx2XkPk`. La salida
pública correspondió a Países Bajos (`NL`). Stremio, Node y
`WebKitNetworkProcess` se encontraron dentro del namespace, y las reglas
nftables rechazaban tráfico IPv4 e IPv6 fuera del túnel.

La prueba real del kill switch consistió en bajar temporalmente la interfaz
WireGuard. En ese estado, `curl` falló con código 7, la reproducción se
detuvo y no hubo salida por la conexión normal.

Verificaciones útiles:

```bash
flatpak list | grep -i stremio
pgrep -af 'vopono|stremio|node|WebKitNetworkProcess'
ip netns list
sudo nft list ruleset
```

No se debe bajar manualmente la interfaz WireGuard salvo para diagnóstico. Esa
acción puede dejar una interfaz virtual huérfana; un reinicio restauró el
estado después de la prueba.

El contenedor Distrobox temporal `vpn-tools` fue eliminado.

## TorBox y Stremio

Comet fue configurado con TorBox y se activó `Scrape Debrid Account Torrents`.
Los resultados `[TB⚡] Comet` aparecieron y reprodujeron correctamente.

Durante la instalación, Torrentio devolvió `HTTP 522`. Se verificó que era un
problema temporal del endpoint, no de Bazzite ni de Vopono.

Los enlaces HTTPS generados por TorBox también pueden reproducirse manualmente
en VLC. VLC no necesita VPN para evitar P2P directo porque descarga desde
TorBox; la VPN solo añade privacidad.

No deben documentarse API keys, enlaces privados, claves WireGuard ni otros
secretos.

## Minecraft Java

Prism Launcher está instalado mediante Flatpak:

```text
org.prismlauncher.PrismLauncher
```

Se agregó la cuenta Microsoft, se activó la gestión automática de Java y se
creó una instancia vanilla. Minecraft abrió y funcionó correctamente.

Verificaciones útiles:

```bash
flatpak list | grep -i prism
flatpak run org.prismlauncher.PrismLauncher
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
