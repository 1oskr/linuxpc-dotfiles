# Matriz de fuente de verdad

## Propósito

Definir dónde reside el estado autorizado de cada dominio de LinuxPC, cómo se
verifica y cuándo debe actualizarse su representación. La matriz distingue el
estado previsto del estado efectivo y no sustituye los inventarios detallados
definidos en proyectos posteriores.

## Categorías y precedencia

- **Repositorio:** estado previsto, revisado y versionado.
- **Sistema:** estado observado y efectivo en el sistema correspondiente.
- **Respaldo:** copia recuperable, independiente o local según su alcance.
- **Secreto:** credenciales y material sensible conservado fuera del
  repositorio público.
- **Estado efímero:** procesos, sesiones, cachés, registros y datos temporales.

Cuando dos fuentes difieren, se aplica esta precedencia por responsabilidad:

1. el sistema autoriza qué está activo o instalado en un momento concreto;
2. el repositorio autoriza qué estado se pretende conservar y reconstruir;
3. el respaldo autoriza únicamente la copia recuperable que contiene;
4. el almacén privado correspondiente autoriza los secretos;
5. el estado efímero sirve para observar y diagnosticar, pero no define por sí
   mismo una configuración mantenible.

Una diferencia entre el sistema y el repositorio debe registrarse y resolverse;
no convierte automáticamente una fuente en sustituta de la otra.

Ningún dato procedente únicamente de conversaciones se considera autorizado
hasta consolidarse en una fuente auditable del repositorio, del sistema, de un
respaldo o de un almacén de secretos.

## Matriz

| Dominio | Dato o responsabilidad | Categoría | Fuente primaria | Fuente secundaria | Método de verificación | Responsable | Evento de actualización |
|---|---|---|---|---|---|---|---|
| Arch Linux | Estado efectivo del sistema principal | sistema | Interfaces y archivos activos de Arch | [Arch Linux](05-arch-linux.md) | Consultar la interfaz o el archivo específico y contrastarlo con la documentación | Oscar | Cambio relevante del sistema |
| Configuración versionada | Estado previsto de dotfiles y scripts | repositorio | Archivos rastreados en la rama aceptada del repositorio | Copia remota en GitHub | `git status`, `git diff` y comprobación de los enlaces activos | Oscar | Cambio de configuración confirmado |
| Documentación | Arquitectura, procedimientos y conocimiento consolidado | repositorio | Documento vigente del dominio | Historial Git | Revisar enlaces, coherencia cruzada y evidencia citada | Oscar | Cambio de comportamiento, arquitectura o procedimiento |
| Paquetes | Paquetes instalados y selección explícita de Arch | sistema | Base de datos local de `pacman` | Referencias parciales en los documentos de Arch y snapshots | `pacman -Q` y `pacman -Qqe` | Oscar | Instalación, eliminación o reclasificación de paquetes |
| Servicios declarados | Unidades, habilitación y configuración persistente | sistema | Unidades y configuración efectiva de systemd | Dotfiles y documentación relacionada | `systemctl cat`, `systemctl is-enabled` e inspección del archivo aplicable | Oscar | Alta, baja o cambio de una unidad |
| Servicios activos | Estado operativo puntual de servicios y procesos | estado efímero | Estado de systemd y procesos activos | Registros del servicio | `systemctl is-active`, `systemctl --failed` y `pgrep` | Oscar | Inicio de sesión, reinicio o diagnóstico |
| Discos y Btrfs | Particiones, UUID, sistemas de archivos, montajes y subvolúmenes | sistema | Metadatos reales del almacenamiento y configuración de montaje efectiva | [Particiones](02-particiones.md), [HDD compartido](04-hdd-compartido.md), [Snapshots](10-snapshots-snapper.md) y [Rollback](14-rollback-permanente.md) | `lsblk`, `findmnt` y herramientas de consulta de Btrfs | Oscar | Cambio de partición, montaje o subvolumen |
| Arranque múltiple | NVRAM UEFI, particiones EFI, GRUB y encadenamiento de otros sistemas | sistema | Estado efectivo de UEFI, ESP y GRUB | [Arquitectura](01-arquitectura.md), [Arranque y GRUB](03-grub.md) y [Bazzite](06-bazzite.md) | `efibootmgr`, inspección de GRUB y prueba controlada de arranque | Oscar | Cambio de UEFI, GRUB, kernel o sistema instalado |
| Hyprland previsto | Configuración mantenible del compositor y sus componentes | repositorio | `.config/hypr`, configuraciones relacionadas y scripts rastreados | [Arch Linux](05-arch-linux.md) y [Dotfiles y Git](07-dotfiles-git.md) | Revisar enlaces, `git diff` y carga de la configuración | Oscar | Cambio confirmado del escritorio |
| Sesión Hyprland | Monitores, clientes y procesos de la sesión activa | estado efímero | Estado expuesto por Hyprland y los procesos de sesión | Configuración versionada | `hyprctl`, `pgrep` y registros temporales aplicables | Oscar | Inicio de sesión o diagnóstico |
| Datos personales | Datos activos, ubicación principal y objetivos de recuperación | sistema | Ubicación activa declarada para cada conjunto | [Mapa de datos y objetivos de recuperación](11-mapa-datos-recuperacion.md) | Lectura y conteo o checksum de una muestra, según criticidad | Oscar | Cambio de ubicación, criticidad, RPO o RTO |
| Recuperación | Procedimientos autorizados y evidencia de restauración | repositorio | Documentos de recuperación correspondientes al alcance | Estado y respaldos utilizados durante la prueba | Revisión del procedimiento y prueba controlada proporcional al riesgo | Oscar | Cambio del sistema o nueva prueba de recuperación |
| Respaldos | Copias disponibles para restauración | respaldo | Destino real de cada copia | Registros de [copia independiente](12-copia-independiente.md) y [restauración](13-prueba-restauracion.md) | Restauración de muestra, lectura y checksum cuando corresponda | Oscar | Según el RPO y después de crear, reemplazar o probar una copia |
| Bazzite | Despliegue, Flatpaks, configuración y datos del sistema gaming | sistema | Instalación activa de Bazzite | [Bazzite](06-bazzite.md) | `rpm-ostree status`, `flatpak list`, `findmnt` e inspección específica | Oscar | Cambio aplicado desde Bazzite |
| Windows | Arranque, configuración y función de compatibilidad | sistema | Instalación activa de Windows | Documentación de arquitectura, particiones, arranque y HDD | Herramientas nativas de Windows y prueba de arranque o acceso | Oscar | Cambio aplicado desde Windows |
| macOS | Configuración del cliente de administración y acceso remoto | sistema | Instalación activa de macOS | [Contexto general](PROJECT_CONTEXT.md) y documentación de acceso remoto en Arch | Inspección local y prueba del canal de acceso | Oscar | Cambio del cliente o del mecanismo de acceso |
| Secretos | Claves, tokens, contraseñas y credenciales | secreto | Almacén privado correspondiente | Documentación no sensible de existencia y recuperación | Prueba de uso o recuperación sin revelar el valor | Oscar | Alta, baja, rotación o cambio de recuperación |
| Decisiones técnicas | Decisión vigente, contexto y consecuencias | repositorio | Documento de dominio que registra la decisión | Roadmap e historial Git | Contrastar la decisión con el estado previsto y el efectivo | Oscar | Adopción, sustitución o revisión de una decisión |
| Estado efímero | Cachés, sesiones, procesos, registros y archivos temporales | estado efímero | Aplicación o entorno de ejecución que los genera | Documentación de diagnóstico cuando exista | Inspección durante el diagnóstico y comprobación de su regeneración | Oscar | No requiere actualización documental rutinaria |

## Brechas y proyectos derivados

La matriz asigna autoridad a familias de estado; no intenta completar sus
inventarios. Las brechas conocidas quedan derivadas de esta manera:

| Brecha | Proyecto responsable |
|---|---|
| Separar configuración común, específica de LinuxPC, personal, sensible y temporal | P1-02 — Límites de configuración |
| Inventariar paquetes, aplicaciones, servicios, escritorio y dependencias externas de Arch | P1-03 — Inventario declarativo de Arch |
| Inventariar configuración relevante fuera de los dotfiles, incluido el hostname, y contrastar las entradas UEFI observadas | P1-04 — Inventario de configuración del sistema |
| Consolidar decisiones e incidencias hoy distribuidas entre documentos e historial Git | P1-18 — Registro de decisiones e incidencias |
| Definir la estrategia detallada de recuperación del despliegue, datos y configuración de Bazzite | P1-22 — Baseline de recuperación de Bazzite |

Hasta completar esos proyectos, la autoridad primaria indicada en la matriz
sigue siendo válida, pero su cobertura puede ser parcial. La ausencia de un
inventario no autoriza a completar datos mediante suposiciones o conversaciones.

## Límites

- La matriz no contiene inventarios completos de paquetes, servicios o archivos.
- La matriz no reproduce secretos ni identifica sus valores.
- La matriz no confirma como actuales valores que solo consten en documentación
  histórica.
- La matriz no resuelve las diferencias pendientes de hostname, entradas UEFI
  o estructura completa de almacenamiento; solo asigna su verificación al
  sistema y su seguimiento al proyecto correspondiente.
