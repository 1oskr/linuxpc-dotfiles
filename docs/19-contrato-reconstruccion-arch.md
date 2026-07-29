# Contrato de reconstrucción de Arch Linux

## Propósito

Definir qué capacidades mínimas debe recuperar una reconstrucción de Arch Linux
para considerarse operativa y reproducible en LinuxPC, sin exigir una réplica
exacta del sistema actual.

## Alcance

Este contrato mide capacidades funcionales. No describe herramientas exactas,
no duplica inventarios y no prescribe automatización.

Se consideran válidas las diferencias de implementación que preserven la
función documentada y mantengan la coherencia con la fuente de verdad del
proyecto.

## Criterios de evaluación

- La evaluación se basa en equivalencia funcional.
- Una reconstrucción es válida si pasan todas las capacidades obligatorias.
- Las capacidades recomendadas amplían cobertura, pero no invalidan por sí
  solas una reconstrucción.
- Las capacidades estéticas quedan fuera del umbral operativo.
- El estado efímero no forma parte del contrato.

## Capacidades mínimas

### 1. El sistema arranca.

- Objetivo: recuperar un sistema que arranca y permite llegar a Arch Linux de
  forma controlada.
- Criterio de aceptación: el gestor de arranque y la entrada de Arch permiten
  iniciar el sistema principal sin intervención extraordinaria.
- Componentes involucrados: firmware UEFI, partición EFI, GRUB, kernel y raíz
  del sistema.
- Fuente de verdad: sistema y documentación de recuperación.
- Método de verificación: arranque exitoso y comprobación de las entradas de
  arranque relevantes.
- Criticidad: crítica.
- Clasificación: obligatorio.
- Documento(s) fuente: [Arranque y GRUB](03-grub.md), [Recuperación del sistema](08-recuperacion.md), [Inventario de configuración del sistema Arch](18-inventario-configuracion-sistema.md).

### 2. El usuario puede entrar y trabajar.

- Objetivo: disponer de una cuenta local usable para tareas habituales del
  sistema.
- Criterio de aceptación: el usuario principal puede iniciar sesión, obtener
  shell y usar privilegios administrativos cuando corresponda.
- Componentes involucrados: cuenta local, `zsh`, `sudo`, terminal y
  configuración personal base.
- Fuente de verdad: sistema y repositorio.
- Método de verificación: inicio de sesión, `id`, `sudo -v` y apertura de una
  shell funcional.
- Criticidad: crítica.
- Clasificación: obligatorio.
- Documento(s) fuente: [Arch Linux](05-arch-linux.md), [Dotfiles y Git](07-dotfiles-git.md), [Límites de configuración](16-limites-configuracion.md).

### 3. El almacenamiento esencial está disponible.

- Objetivo: recuperar los montajes y subvolúmenes necesarios para operar el
  sistema y acceder a los datos principales.
- Criterio de aceptación: raíz, `/home`, `/.snapshots`, `/boot/efi` y el HDD
  compartido montan con la configuración esperada.
- Componentes involucrados: Btrfs, `fstab`, ESP, HDD compartido y utilidades
  de verificación de montajes.
- Fuente de verdad: sistema.
- Método de verificación: `lsblk`, `findmnt` y verificación de montajes
  persistentes.
- Criticidad: crítica.
- Clasificación: obligatorio.
- Documento(s) fuente: [Recuperación del sistema](08-recuperacion.md), [Inventario de configuración del sistema Arch](18-inventario-configuracion-sistema.md).

### 4. El escritorio funcional está disponible.

- Objetivo: recuperar una sesión gráfica utilizable para el trabajo diario.
- Criterio de aceptación: la sesión de escritorio inicia y ofrece interacción
  estable con entrada, salida visual y componentes mínimos del entorno.
- Componentes involucrados: compositor, portal gráfico, barra, lanzador y
  componentes de sesión.
- Fuente de verdad: repositorio y sistema.
- Método de verificación: inicio de sesión gráfico y comprobación de los
  componentes mínimos de la sesión.
- Criticidad: alta.
- Clasificación: obligatorio.
- Documento(s) fuente: [Arch Linux](05-arch-linux.md), [Inventario declarativo de Arch Linux](17-inventario-arch.md), [Inventario de configuración del sistema Arch](18-inventario-configuracion-sistema.md).

### 5. El entorno de trabajo cotidiano funciona.

- Objetivo: conservar un conjunto de herramientas de uso diario para
  navegación, edición y tareas personales habituales.
- Criterio de aceptación: el usuario dispone de utilidades suficientes para
  operar con archivos, terminal, navegación básica y consultas frecuentes.
- Componentes involucrados: terminal, navegador, utilidades de archivos y
  aplicaciones de uso general.
- Fuente de verdad: repositorio e inventario declarativo.
- Método de verificación: apertura de las aplicaciones y uso de una muestra
  representativa de las tareas cotidianas.
- Criticidad: alta.
- Clasificación: recomendado.
- Documento(s) fuente: [Inventario declarativo de Arch Linux](17-inventario-arch.md), [Dotfiles y Git](07-dotfiles-git.md).

### 6. El entorno de desarrollo está operativo.

- Objetivo: disponer de las capacidades mínimas para trabajar en el repositorio
  y en tareas técnicas del proyecto.
- Criterio de aceptación: el sistema permite controlar cambios, revisar
  diferencias y usar las herramientas base de desarrollo previstas.
- Componentes involucrados: Git, herramientas base, soporte AUR y utilidades de
  shell.
- Fuente de verdad: repositorio e inventario declarativo.
- Método de verificación: `git status`, `git diff`, `git log` y comprobación
  de herramientas esenciales.
- Criticidad: alta.
- Clasificación: obligatorio.
- Documento(s) fuente: [Dotfiles y Git](07-dotfiles-git.md), [Inventario declarativo de Arch Linux](17-inventario-arch.md).

### 7. La red y el audio funcionan.

- Objetivo: recuperar conectividad y salida de audio de sesión.
- Criterio de aceptación: el sistema tiene red utilizable y el audio de la
  sesión funciona correctamente.
- Componentes involucrados: red del sistema, pila de audio de sesión y
  servicios relacionados.
- Fuente de verdad: sistema e inventario declarativo.
- Método de verificación: conectividad real y reproducción o inspección de
  audio funcional.
- Criticidad: alta.
- Clasificación: obligatorio.
- Documento(s) fuente: [Inventario declarativo de Arch Linux](17-inventario-arch.md), [Inventario de configuración del sistema Arch](18-inventario-configuracion-sistema.md).

### 8. El acceso remoto funciona.

- Objetivo: permitir administración remota mínima del sistema.
- Criterio de aceptación: SSH opera como canal remoto obligatorio mínimo.
- Componentes involucrados: `openssh`, red y configuración de acceso.
- Fuente de verdad: sistema y documentación de acceso remoto.
- Método de verificación: conexión SSH válida y acceso de administración
  básico.
- Criticidad: alta.
- Clasificación: obligatorio.
- Documento(s) fuente: [Dotfiles y Git](07-dotfiles-git.md), [Inventario declarativo de Arch Linux](17-inventario-arch.md), [Inventario de configuración del sistema Arch](18-inventario-configuracion-sistema.md).

### 9. El sistema puede recuperarse.

- Objetivo: conservar mecanismos de recuperación capaces de devolver Arch a un
  estado operativo tras un fallo.
- Criterio de aceptación: snapshots, rollback y recuperación de arranque están
  disponibles y documentados.
- Componentes involucrados: Snapper, `snap-pac`, `grub-btrfs`, GRUB y
  procedimientos de recuperación.
- Fuente de verdad: sistema y documentación de recuperación.
- Método de verificación: comprobación de snapshots y validación de un
  procedimiento de recuperación controlado.
- Criticidad: crítica.
- Clasificación: obligatorio.
- Documento(s) fuente: [Recuperación del sistema](08-recuperacion.md), [Inventario declarativo de Arch Linux](17-inventario-arch.md), [Inventario de configuración del sistema Arch](18-inventario-configuracion-sistema.md).

### 10. Los datos pueden restaurarse.

- Objetivo: recuperar conjuntos de datos críticos desde respaldos o copias
  verificadas.
- Criterio de aceptación: al menos una muestra representativa o un conjunto
  crítico puede restaurarse con integridad comprobable.
- Componentes involucrados: respaldos, HDD compartido y procedimientos de
  recuperación.
- Fuente de verdad: respaldo y documentación de recuperación.
- Método de verificación: restauración de muestra, lectura y comprobación de
  integridad según criticidad.
- Criticidad: crítica.
- Clasificación: obligatorio.
- Documento(s) fuente: [Recuperación del sistema](08-recuperacion.md), [Mapa de datos y objetivos de recuperación](11-mapa-datos-recuperacion.md), [Prueba integral de restauración](13-prueba-restauracion.md).

### 11. La configuración del sistema es reproducible.

- Objetivo: reconstruir la configuración declarada de Arch Linux sin depender
  de conocimiento implícito.
- Criterio de aceptación: los dotfiles y la configuración del sistema se
  pueden reponer de forma coherente y verificable.
- Componentes involucrados: dotfiles, enlaces simbólicos, configuración del
  sistema y documentación relacionada.
- Fuente de verdad: repositorio y matriz de fuente de verdad.
- Método de verificación: `git status`, comprobación de enlaces activos y
  revisión de la carga efectiva de la configuración.
- Criticidad: alta.
- Clasificación: obligatorio.
- Documento(s) fuente: [Dotfiles y Git](07-dotfiles-git.md), [Matriz de fuente de verdad](15-matriz-fuente-de-verdad.md), [Límites de configuración](16-limites-configuracion.md), [Inventario de configuración del sistema Arch](18-inventario-configuracion-sistema.md).

### 12. La documentación permite operar la reconstrucción.

- Objetivo: permitir que la reconstrucción pueda ejecutarse y verificarse a
  partir de documentación permanente y auditable.
- Criterio de aceptación: los documentos fuente bastan para entender el
  alcance, las dependencias y las comprobaciones mínimas del contrato.
- Componentes involucrados: documentos de contexto, inventarios, recuperación
  y roadmap.
- Fuente de verdad: repositorio.
- Método de verificación: revisión cruzada de enlaces, criterios y referencias
  necesarias para reconstruir y comprobar el sistema.
- Criticidad: alta.
- Clasificación: obligatorio.
- Documento(s) fuente: [Contexto general del proyecto](PROJECT_CONTEXT.md), [Arch Linux](05-arch-linux.md), [Dotfiles y Git](07-dotfiles-git.md), [Recuperación del sistema](08-recuperacion.md), [Matriz de fuente de verdad](15-matriz-fuente-de-verdad.md), [Límites de configuración](16-limites-configuracion.md), [Inventario declarativo de Arch Linux](17-inventario-arch.md), [Inventario de configuración del sistema Arch](18-inventario-configuracion-sistema.md).

## Capacidades excluidas del contrato

- Bluetooth.
- Replicación exacta de paquetes.
- Igualdad bit a bit con el sistema observado.
- Preferencias estéticas que no alteran la operatividad.
- Estado generado o efímero.
- Automatización de reconstrucción.

## Criterio global de reconstrucción

Una reconstrucción de Arch Linux se considera válida cuando cumple todas las
capacidades obligatorias de este contrato.

Las capacidades recomendadas amplían la cobertura funcional, pero no cambian
por sí solas el resultado de validación. Las diferencias de implementación se
admiten cuando la capacidad correspondiente conserva su función y su método de
verificación sigue siendo satisfactible.

## Vacíos y dependencias

Este contrato depende de la vigencia de los documentos fuente enlazados y de la
precisión de los inventarios y procedimientos de recuperación ya existentes.

Los vacíos conocidos no bloquean este documento, pero pueden afectar futuras
revisiones:

- canales remotos adicionales fuera de SSH;
- decisiones posteriores sobre Bluetooth;
- evolución futura del entorno de desarrollo y del escritorio;
- ampliaciones de la automatización de reconstrucción.

## Documentos fuente

- [Contexto general del proyecto](PROJECT_CONTEXT.md)
- [Arch Linux](05-arch-linux.md)
- [Dotfiles y Git](07-dotfiles-git.md)
- [Recuperación del sistema](08-recuperacion.md)
- [Roadmap maestro ejecutable](09-roadmap.md)
- [Matriz de fuente de verdad](15-matriz-fuente-de-verdad.md)
- [Límites de configuración](16-limites-configuracion.md)
- [Inventario declarativo de Arch Linux](17-inventario-arch.md)
- [Inventario de configuración del sistema Arch](18-inventario-configuracion-sistema.md)
- [Mapa de datos y objetivos de recuperación](11-mapa-datos-recuperacion.md)
- [Prueba integral de restauración](13-prueba-restauracion.md)
