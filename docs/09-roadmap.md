# Roadmap LinuxPC

## Estado general

### Completado

- Instalación de Windows 11.
- Instalación de Arch Linux.
- Instalación de Bazzite.
- Triple arranque funcional con GRUB.
- Arch configurado como sistema principal.
- Bazzite configurado como sistema gaming.
- Windows mantenido para compatibilidad.
- HDD compartido entre los tres sistemas.
- Montaje persistente del HDD en Arch.
- Montaje persistente del HDD en Bazzite.
- Dotfiles respaldados en GitHub.
- Configuración inicial de Hyprland.
- Configuración inicial de Waybar.
- Configuración inicial de Kitty.
- Configuración inicial de Rofi.
- Configuración inicial de Starship.
- Configuración inicial de Btop.
- Configuración inicial de Fastfetch.
- Configuración inicial de Hyprpaper.
- Configuración inicial de Hyprsunset.
- Configuración inicial de Snappy Switcher.
- Documentación base del proyecto.

## Fase 1 — estabilidad y recuperación

### Pendiente

- Configurar snapshots de Arch.
- Revisar estrategia de snapshots para Bazzite.
- Probar restauración de Arch desde snapshot.
- Crear respaldo de `/etc`.
- Documentar recuperación de Btrfs.
- Definir estrategia de backup del HDD.
- Crear respaldo externo de datos importantes.
- Probar recuperación de dotfiles en una carpeta temporal.

## Fase 2 — organización del HDD

### Pendiente

- Revisar la estructura actual del HDD.
- Definir carpetas definitivas.
- Separar:

```text
Universidad
Trabajo
Proyectos
Documentos
Descargas
Fotografías
Juegos
Steam
ROMs
Backups
Recuperación
```

- Crear accesos directos desde Arch.
- Crear accesos directos desde Bazzite.
- Definir carpetas compartidas con Windows.
- Revisar permisos.
- Definir política de nombres.
- Eliminar archivos temporales y carpetas obsoletas.

## Fase 3 — entorno Arch

### En progreso

- Finalizar apariencia de Hyprland.
- Revisar Waybar.
- Revisar reglas de ventanas.
- Revisar workspaces.
- Revisar monitores.
- Revisar animaciones.
- Revisar atajos.
- Revisar autostart.
- Mejorar integración con aplicaciones.
- Configurar portapapeles.
- Configurar notificaciones.
- Revisar bloqueo de pantalla.
- Configurar suspensión e hibernación.
- Revisar gestión de energía.
- Revisar audio.
- Revisar Bluetooth.
- Revisar Wi-Fi.
- Revisar fuentes.
- Revisar temas GTK.
- Revisar cursores e iconos.

## Fase 4 — entorno de estudio y programación

### Pendiente

- Configurar Visual Studio Code.
- Versionar ajustes seguros de VS Code.
- Instalar entorno LaTeX.
- Configurar compilación local.
- Instalar Python.
- Configurar entornos virtuales.
- Instalar MATLAB o alternativa compatible.
- Configurar Git.
- Configurar SSH.
- Configurar herramientas matemáticas.
- Configurar Jupyter.
- Configurar utilidades científicas.
- Definir estructura de proyectos.

## Fase 5 — gaming

### Pendiente

- Configurar Steam en Bazzite.
- Definir biblioteca de Steam en el HDD.
- Configurar emulación.
- Organizar ROMs.
- Configurar mandos.
- Revisar NVIDIA.
- Revisar FPS.
- Configurar grabación.
- Configurar edición de video.
- Documentar compatibilidad de juegos.

## Fase 6 — automatización

### Pendiente

- Crear script de instalación de paquetes.
- Crear script de enlaces simbólicos.
- Crear script de restauración de dotfiles.
- Crear script de configuración inicial.
- Crear script de backup.
- Crear script de mantenimiento.
- Crear verificación automática del sistema.
- Crear inventario de paquetes.
- Crear exportación de Flatpaks.
- Crear exportación de extensiones de VS Code.

## Fase 7 — documentación continua

### Pendiente

- Actualizar documentación después de cada cambio importante.
- Añadir fecha y motivo de cada decisión.
- Documentar errores y soluciones.
- Documentar procedimientos de reversión.
- Mantener comandos verificados.
- Marcar configuraciones experimentales.
- Revisar documentación antes de cada commit.
- Mantener sincronización entre sistema, Git y GitHub.

## Próximo bloque recomendado

Configurar snapshots y recuperación de Arch Linux antes de continuar con cambios estéticos o reorganización masiva del HDD.