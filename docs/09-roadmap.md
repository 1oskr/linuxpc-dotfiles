# Roadmap maestro de LinuxPC

## Objetivo

Este roadmap convierte la dirección estratégica de LinuxPC en un plan de ejecución formado por proyectos pequeños, verificables y ordenados por dependencias y reducción de riesgo.

Su función es permitir que el proyecto evolucione de manera incremental sin perder de vista la continuidad de los datos, la reproducibilidad del sistema, la estabilidad del entorno principal y la conservación del conocimiento adquirido.

La prioridad permanente entre sistemas es:

```text
Arch Linux
↓
macOS
↓
Bazzite
↓
Windows
```

Arch Linux es el sistema principal y concentra el desarrollo técnico. macOS ocupa el segundo nivel como entorno complementario de administración, edición y trabajo remoto. Bazzite se mantiene como plataforma especializada para gaming. Windows conserva una función mínima de compatibilidad.

## Alcance

El roadmap cubre:

- continuidad, respaldo y recuperación;
- gobierno técnico y fuente de verdad;
- reproducibilidad de Arch Linux;
- plataforma y servicios esenciales de Arch;
- infraestructura, productividad y apariencia del escritorio;
- terminal, estudio y desarrollo;
- organización de datos compartidos;
- gestión del conocimiento;
- uso de IA, Work y agentes;
- integración con macOS;
- recuperación y gaming en Bazzite;
- compatibilidad mínima con Windows;
- automatización, verificación, rendimiento y portabilidad.

El roadmap define resultados, dependencias y criterios de finalización. No prescribe por sí mismo decisiones de implementación. Cada proyecto debe investigarse y planificarse dentro de su alcance antes de modificar el sistema.

## Estructura

La jerarquía del documento es:

```text
Roadmap
└── Épicas
    └── Proyectos
```

Una épica agrupa proyectos relacionados por una capacidad común. Un proyecto es la unidad mínima de ejecución y debe poder iniciarse, verificarse, documentarse y cerrarse de manera independiente una vez completadas sus dependencias.

## Criterios de prioridad

### P0 — Supervivencia

Incluye únicamente proyectos necesarios para evitar una pérdida irreversible de datos o una recuperación no controlada. Un proyecto P0 tiene precedencia sobre cualquier trabajo funcional, estético o de optimización.

### P1 — Sistema operativo del proyecto

Incluye los proyectos que hacen que Arch Linux y los flujos cotidianos sean reproducibles, estables, comprensibles y mantenibles. También abarca macOS como segundo entorno de trabajo, la gestión del conocimiento, los flujos con IA y la recuperación básica de Bazzite.

### P2 — Evolución

Incluye automatización posterior a la estabilización, apariencia, gaming, rendimiento, portabilidad y compatibilidad secundaria. Estos proyectos no deben desplazar trabajos P0 o P1 de los que dependan.

La prioridad numérica no sustituye las dependencias. Dentro de una misma prioridad se debe respetar la secuencia definida por los proyectos y las olas de ejecución.

## Convención de estados

Los únicos estados admitidos son:

- **No iniciado:** el proyecto forma parte del backlog y todavía no se prepara.
- **En preparación:** se está reuniendo contexto, verificando prerequisitos y delimitando el trabajo.
- **En progreso:** se está ejecutando el trabajo previsto.
- **En pruebas:** el resultado se está verificando contra su criterio de finalización.
- **Documentando:** las pruebas terminaron y se está sincronizando la documentación.
- **Completado:** el criterio de finalización se cumplió, las dependencias resultantes están disponibles y la documentación quedó actualizada.
- **Pausado:** el proyecto se interrumpió de forma explícita y conserva registrado el motivo, el estado alcanzado y las condiciones para reanudarlo.

La transición normal es:

```text
No iniciado
→ En preparación
→ En progreso
→ En pruebas
→ Documentando
→ Completado
```

`Pausado` puede utilizarse desde cualquier estado activo cuando no sea posible continuar de forma responsable.

## Reglas para iniciar proyectos

1. Solo puede existir un proyecto activo a la vez.
2. Se consideran activos los estados `En preparación`, `En progreso`, `En pruebas` y `Documentando`.
3. Todos los prerequisitos deben estar disponibles antes de cambiar un proyecto a `En preparación`.
4. Todos los proyectos indicados como dependencias deben estar `Completados`.
5. El alcance, el criterio de finalización y los riesgos deben revisarse antes de comenzar.
6. Las incertidumbres capaces de cambiar el resultado deben resolverse o registrarse explícitamente.
7. Un proyecto no debe incorporar trabajo perteneciente a otro proyecto salvo que el roadmap se revise antes.

## Reglas para cerrar proyectos

1. El criterio de finalización debe cumplirse por completo.
2. Las verificaciones relevantes deben haber terminado satisfactoriamente.
3. Los riesgos detectados deben estar resueltos, aceptados o convertidos en proyectos posteriores.
4. La documentación relacionada debe representar el estado resultante.
5. Las decisiones importantes y las limitaciones conocidas deben quedar registradas.
6. Las dependencias que el proyecto desbloquea deben poder utilizar su resultado.
7. Solo después de estas comprobaciones el estado puede cambiar a `Completado`.

## Duraciones

Las duraciones representan tiempo de trabajo concentrado:

- **1 sesión:** aproximadamente entre 2 y 4 horas.
- **1–2 sesiones:** proyecto breve que puede requerir una segunda sesión de validación o documentación.
- **2 sesiones:** proyecto acotado distribuido entre dos jornadas de trabajo.
- **2–3 sesiones:** proyecto pequeño distribuido entre varios días.

Las estimaciones no incluyen tiempos de observación, transferencias extensas, descargas o espera entre pruebas. Deben revisarse durante `En preparación` si aparece información nueva.

## Base existente

El roadmap parte de una base funcional ya documentada:

- Windows 11, Arch Linux y Bazzite están instalados.
- El triple arranque con GRUB está operativo.
- Arch Linux funciona como sistema principal.
- Bazzite cumple la función de sistema gaming.
- Windows se conserva para compatibilidad.
- El HDD NTFS está compartido y tiene montaje persistente en Arch y Bazzite.
- Los dotfiles están versionados y respaldados mediante Git y GitHub.
- Existe una configuración inicial de Hyprland y sus componentes principales.
- Snapper, `snap-pac` y `grub-btrfs` están configurados en Arch.
- El arranque temporal de un snapshot mediante OverlayFS fue validado.
- Existe un respaldo manual verificado de `/etc`.
- La recuperación de dotfiles mediante una clonación limpia fue probada.
- Existe documentación base de arquitectura, almacenamiento, arranque y recuperación.

Esta base no implica que los proyectos siguientes estén completados. Cada proyecto define un resultado más amplio y un criterio propio que todavía debe verificarse.

# Épica: Continuidad y recuperación

## P0-01 — Mapa de datos y objetivos de recuperación

- **Estado:** Completado
- **Objetivo:** determinar qué información existe, cuál es irremplazable y qué nivel de pérdida o interrupción es aceptable.
- **Prioridad:** P0
- **Prerequisitos:** acceso al estado actual de Arch Linux, `/home` y el HDD compartido.
- **Dependencias:** ninguna.
- **Duración estimada:** 1–2 sesiones.
- **Criterio de finalización:** todos los conjuntos de datos identificados tienen propietario, criticidad, ubicación y objetivo de recuperación definidos.
- **Documentación relacionada:** [Contexto general](PROJECT_CONTEXT.md), [Arquitectura](01-arquitectura.md), [Particiones](02-particiones.md), [HDD compartido](04-hdd-compartido.md) y [Recuperación](08-recuperacion.md).
- **Riesgos:** omitir datos implícitos, configuraciones sensibles o información almacenada fuera de las rutas conocidas.

## P0-02 — Copia independiente de datos críticos

- **Estado:** Completado
- **Objetivo:** asegurar que los datos críticos sobrevivan a la pérdida completa del equipo.
- **Prioridad:** P0
- **Prerequisitos:** destino de respaldo independiente disponible.
- **Dependencias:** P0-01.
- **Duración estimada:** 2–3 sesiones.
- **Criterio de finalización:** cada conjunto crítico posee al menos una copia independiente, identificable y verificada.
- **Documentación relacionada:** [HDD compartido](04-hdd-compartido.md), [Recuperación](08-recuperacion.md) y [Snapshots](10-snapshots-snapper.md).
- **Riesgos:** confundir snapshots o copias dentro del mismo equipo con respaldos independientes.

## P0-03 — Prueba integral de restauración

- **Estado:** Completado
- **Objetivo:** demostrar que los respaldos permiten recuperar información utilizable.
- **Prioridad:** P0
- **Prerequisitos:** medio de prueba y copias creadas por P0-02.
- **Dependencias:** P0-02.
- **Duración estimada:** 2 sesiones.
- **Criterio de finalización:** se restauran muestras representativas de `/home`, HDD, dotfiles y `/etc`, y se comprueba su integridad y utilidad.
- **Documentación relacionada:** [Dotfiles y Git](07-dotfiles-git.md) y [Recuperación](08-recuperacion.md).
- **Riesgos:** validar solamente la existencia de archivos sin comprobar que sean completos y utilizables.

## P0-04 — Rollback permanente de Arch

- **Estado:** Completado
- **Objetivo:** cerrar la principal brecha pendiente de la recuperación de Arch Linux.
- **Prioridad:** P0
- **Prerequisitos:** respaldo verificado, snapshots válidos y una ventana de mantenimiento.
- **Dependencias:** P0-03.
- **Duración estimada:** 2 sesiones.
- **Criterio de finalización:** se completa una prueba controlada de rollback permanente y se confirma el regreso a un estado operativo normal.
- **Documentación relacionada:** [Recuperación](08-recuperacion.md), [Snapshots](10-snapshots-snapper.md) y [Rollback permanente](14-rollback-permanente.md).
- **Riesgos:** afectar `/home`, GRUB, snapshots posteriores o la coherencia entre la raíz y los datos de usuario.

# Épica: Gobierno y reproducibilidad

## P1-01 — Matriz de fuente de verdad

- **Estado:** Completado
- **Objetivo:** establecer dónde reside el estado autorizado de cada componente de LinuxPC.
- **Prioridad:** P1
- **Prerequisitos:** mapa de datos y objetivos de recuperación terminado.
- **Dependencias:** P0-01.
- **Duración estimada:** 1 sesión.
- **Criterio de finalización:** cada componente tiene una fuente de verdad y una categoría definida: repositorio, sistema, respaldo, secreto o estado efímero.
- **Documentación relacionada:** [Matriz de fuente de verdad](15-matriz-fuente-de-verdad.md), [Contexto general](PROJECT_CONTEXT.md), [Dotfiles y Git](07-dotfiles-git.md) y este roadmap.
- **Riesgos:** declarar el repositorio como fuente de verdad para elementos que todavía no representa.

## P1-02 — Límites de configuración

- **Estado:** Completado
- **Objetivo:** separar configuración común, específica de LinuxPC, personal, sensible y temporal.
- **Prioridad:** P1
- **Prerequisitos:** matriz de fuente de verdad disponible.
- **Dependencias:** P1-01.
- **Duración estimada:** 1–2 sesiones.
- **Criterio de finalización:** cada familia de configuración tiene alcance y propietario definidos.
- **Documentación relacionada:** [Límites de configuración](16-limites-configuracion.md), [Matriz de fuente de verdad](15-matriz-fuente-de-verdad.md), [Contexto general](PROJECT_CONTEXT.md), [Arch Linux](05-arch-linux.md) y [Dotfiles y Git](07-dotfiles-git.md).
- **Riesgos:** introducir una abstracción demasiado compleja para una sola máquina.

## P1-03 — Inventario declarativo de Arch

- **Estado:** Completado
- **Objetivo:** registrar todo lo necesario para explicar el estado operativo de Arch Linux.
- **Prioridad:** P1
- **Prerequisitos:** acceso al sistema Arch activo.
- **Dependencias:** P1-01.
- **Duración estimada:** 2–3 sesiones.
- **Criterio de finalización:** paquetes, servicios, aplicaciones, componentes del escritorio y dependencias externas están inventariados y clasificados.
- **Documentación relacionada:** [Inventario declarativo de Arch Linux](17-inventario-arch.md), [Arch Linux](05-arch-linux.md), [Dotfiles y Git](07-dotfiles-git.md) y [Snapshots](10-snapshots-snapper.md).
- **Riesgos:** registrar paquetes instalados sin distinguir una necesidad explícita de una dependencia incidental.

## P1-04 — Inventario de configuración del sistema

- **Estado:** Completado
- **Objetivo:** identificar el estado relevante que actualmente vive fuera de los dotfiles.
- **Prioridad:** P1
- **Prerequisitos:** acceso administrativo de lectura al sistema Arch.
- **Dependencias:** P1-01.
- **Duración estimada:** 2 sesiones.
- **Criterio de finalización:** las configuraciones relevantes de arranque, montajes, snapshots, red, servicios y sesión tienen propietario y criticidad definidos.
- **Documentación relacionada:** [Inventario de configuración del sistema](18-inventario-configuracion-sistema.md), [Arranque y GRUB](03-grub.md), [HDD compartido](04-hdd-compartido.md), [Arch Linux](05-arch-linux.md), [Recuperación](08-recuperacion.md) y [Snapshots](10-snapshots-snapper.md).
- **Riesgos:** capturar secretos o confundir archivos generados con configuración mantenible.

## P1-05 — Contrato de reconstrucción de Arch

- **Estado:** Completado
- **Objetivo:** definir qué significa que Arch Linux sea reproducible.
- **Prioridad:** P1
- **Prerequisitos:** inventarios completos y restauración de respaldos probada.
- **Dependencias:** P0-03, P1-02, P1-03 y P1-04.
- **Duración estimada:** 1–2 sesiones.
- **Criterio de finalización:** existe una lista finita de capacidades y verificaciones que debe superar una reconstrucción para considerarse operativa.
- **Documentación relacionada:** [Contexto general](PROJECT_CONTEXT.md), [Arch Linux](05-arch-linux.md), [Dotfiles y Git](07-dotfiles-git.md), [Recuperación](08-recuperacion.md) y [Contrato de reconstrucción de Arch Linux](19-contrato-reconstruccion-arch.md).
- **Riesgos:** exigir una réplica exacta del sistema en lugar de reproducibilidad funcional.

## P1-06 — Recuperación del arranque multisistema

- **Estado:** Completado
- **Objetivo:** validar que Arch Linux pueda recuperar el acceso a los sistemas instalados.
- **Resultado:** desde Arch ISO en modo UEFI se reinstaló GRUB en la EFI principal y se regeneró `grub.cfg`; tras retirar el USB, Arch Linux, Bazzite y Windows arrancaron correctamente. La EFI de Bazzite no fue modificada.
- **Prioridad:** P1
- **Prerequisitos:** medio de recuperación disponible y respaldo verificado.
- **Dependencias:** P0-03.
- **Duración estimada:** 1–2 sesiones.
- **Criterio de finalización:** el procedimiento de recuperación de GRUB y sus entradas queda verificado contra el estado actual del equipo.
- **Documentación relacionada:** [Arquitectura](01-arquitectura.md), [Particiones](02-particiones.md), [Arranque y GRUB](03-grub.md) y [Recuperación](08-recuperacion.md).
- **Riesgos:** modificar la partición EFI o las entradas UEFI equivocadas.

# Épica: Plataforma Arch

## P1-07 — Baseline de servicios esenciales

- **Estado:** Completado
- **Objetivo:** definir el estado operativo esperado de red, audio, Bluetooth, almacenamiento, energía y hardware.
- **Resultado:** NetworkManager, PipeWire/WirePlumber, Bluetooth, monitores y servicios esenciales verificados; servicios redundantes de Redshift e Hyprpaper deshabilitados; cero unidades fallidas de sistema y usuario.
- **Prioridad:** P1
- **Prerequisitos:** inventario declarativo de Arch disponible.
- **Dependencias:** P1-03 y P1-04.
- **Duración estimada:** 2–3 sesiones.
- **Criterio de finalización:** cada servicio esencial tiene comportamiento esperado, estado conocido y criterio de diagnóstico.
- **Documentación relacionada:** [Contexto general](PROJECT_CONTEXT.md) y [Arch Linux](05-arch-linux.md).
- **Riesgos:** ampliar el alcance hacia optimizaciones prematuras o mezclar servicios independientes.

## P1-08 — Seguridad y acceso desde macOS

- **Estado:** Completado
- **Objetivo:** consolidar macOS como segundo entorno de administración, edición y trabajo remoto mediante un único canal remoto mantenido y endurecido.
- **Resultado:** SSH quedó como único canal remoto mantenido; `sshd.service` está habilitado y activo en Arch; el equipo usa IP fija `192.168.1.50`; desde macOS funciona `ssh arch`; la autenticación por contraseña e interactiva está desactivada y solo se acepta clave pública; `rustdesk-bin`, `sunshine-bin` y `sunshine-bin-debug` fueron retirados del sistema y Moonlight no forma parte del baseline de Arch.
- **Prioridad:** P1
- **Prerequisitos:** inventario de SSH, verificación del acceso desde macOS y revisión de los canales remotos alternativos presentes en Arch.
- **Dependencias:** P1-03 y P1-07.
- **Duración estimada:** 2 sesiones.
- **Criterio de finalización:** el acceso remoto desde macOS queda documentado y verificado con SSH como único canal mantenido, con política de autenticación endurecida, dirección y alias SSH configurados, y sin servicios gráficos remotos no mantenidos dentro del baseline de Arch.
- **Documentación relacionada:** [Contexto general](PROJECT_CONTEXT.md) y [Arch Linux](05-arch-linux.md).
- **Riesgos:** dependencia operativa de un único canal remoto, pérdida de la clave pública autorizada o cambios de red que rompan la resolución esperada de `ssh arch`. Permanece sin identificar la regla del router `WAN TCP 45333 → 192.168.1.90:4567`; no fue modificada porque no interviene en el acceso SSH actual.

# Épica: Infraestructura del escritorio

## P1-09 — Ciclo de vida de la sesión Hyprland

- **Estado:** No iniciado
- **Objetivo:** hacer explícito qué inicia, mantiene y termina la sesión gráfica.
- **Prioridad:** P1
- **Prerequisitos:** baseline de servicios y dependencias del escritorio inventariadas.
- **Dependencias:** P1-03 y P1-07.
- **Duración estimada:** 2 sesiones.
- **Criterio de finalización:** todos los procesos de sesión tienen una responsabilidad conocida y no quedan artefactos requeridos fuera del inventario.
- **Documentación relacionada:** [Arch Linux](05-arch-linux.md) y [Dotfiles y Git](07-dotfiles-git.md).
- **Riesgos:** procesos duplicados, fallos silenciosos y dependencias como `waybar-hover` o `start-hyprland` no representadas.

## P1-10 — Perfil físico de LinuxPC

- **Estado:** No iniciado
- **Objetivo:** delimitar la configuración ligada a monitores, GPU, rutas y hardware específico.
- **Prioridad:** P1
- **Prerequisitos:** límites de configuración definidos.
- **Dependencias:** P1-02 y P1-09.
- **Duración estimada:** 1–2 sesiones.
- **Criterio de finalización:** toda dependencia física conocida del equipo pertenece claramente al perfil de LinuxPC o queda clasificada como configuración común.
- **Documentación relacionada:** [Arch Linux](05-arch-linux.md) y [Dotfiles y Git](07-dotfiles-git.md).
- **Riesgos:** trasladar al perfil de máquina configuraciones que deberían ser comunes.

## P1-11 — Modelo de workspaces y ventanas

- **Estado:** No iniciado
- **Objetivo:** definir el comportamiento funcional de navegación, colocación y reglas de aplicaciones.
- **Prioridad:** P1
- **Prerequisitos:** ciclo de sesión estable y flujos cotidianos identificados.
- **Dependencias:** P1-09 y P1-10.
- **Duración estimada:** 2 sesiones.
- **Criterio de finalización:** workspaces, reglas y atajos responden a un modelo coherente y verificable.
- **Documentación relacionada:** [Arch Linux](05-arch-linux.md). No existe todavía documentación específica para este modelo.
- **Riesgos:** diseñar reglas alrededor de aplicaciones circunstanciales o crear demasiadas excepciones.

## P1-12 — Servicios esenciales del escritorio

- **Estado:** No iniciado
- **Objetivo:** completar bloqueo, notificaciones, portapapeles y control básico de la sesión.
- **Prioridad:** P1
- **Prerequisitos:** ciclo de vida del escritorio definido.
- **Dependencias:** P1-09 y P1-11.
- **Duración estimada:** 2–3 sesiones.
- **Criterio de finalización:** las funciones esenciales del escritorio operan de forma consistente en uso local y remoto.
- **Documentación relacionada:** [Arch Linux](05-arch-linux.md) y este roadmap.
- **Riesgos:** solapamiento entre herramientas o comportamiento diferente durante el acceso remoto.

# Épica: Productividad

## P1-13 — Flujo de terminal

- **Estado:** No iniciado
- **Objetivo:** consolidar Zsh, Kitty, Starship y las utilidades personales como una interfaz operativa coherente.
- **Prioridad:** P1
- **Prerequisitos:** inventario de herramientas y dependencias disponible.
- **Dependencias:** P1-02 y P1-03.
- **Duración estimada:** 1–2 sesiones.
- **Criterio de finalización:** comandos, funciones y herramientas personales tienen propósito, dependencia y comportamiento conocidos.
- **Documentación relacionada:** [Arch Linux](05-arch-linux.md) y [Dotfiles y Git](07-dotfiles-git.md).
- **Riesgos:** alias que oculten comportamientos importantes o configuraciones que se modifiquen durante el uso.

## P1-14 — Arquitectura del HDD compartido

- **Estado:** No iniciado
- **Objetivo:** definir la organización estable de datos, respaldos, bibliotecas y proyectos compartidos.
- **Prioridad:** P1
- **Prerequisitos:** respaldo y restauración del HDD probados.
- **Dependencias:** P0-03.
- **Duración estimada:** 2 sesiones.
- **Criterio de finalización:** cada categoría de información tiene ubicación, propietario, política de nombres y sistemas consumidores definidos.
- **Documentación relacionada:** [HDD compartido](04-hdd-compartido.md) y este roadmap.
- **Riesgos:** rotura de rutas, bibliotecas o referencias existentes.

## P1-15 — Entorno de estudio y desarrollo

- **Estado:** No iniciado
- **Objetivo:** establecer las capacidades mínimas para programación, matemáticas, ingeniería e investigación.
- **Prioridad:** P1
- **Prerequisitos:** plataforma Arch estable y estructura de datos definida.
- **Dependencias:** P1-07, P1-13 y P1-14.
- **Duración estimada:** 2–3 sesiones.
- **Criterio de finalización:** las capacidades mínimas de edición, compilación, Python, LaTeX, Git y trabajo científico están definidas y verificadas.
- **Documentación relacionada:** [Contexto general](PROJECT_CONTEXT.md), [Arch Linux](05-arch-linux.md) y este roadmap.
- **Riesgos:** incorporar simultáneamente demasiadas herramientas o duplicar entornos con responsabilidades equivalentes.

# Épica: Gestión del conocimiento

## P1-16 — Arquitectura del conocimiento

- **Estado:** No iniciado
- **Objetivo:** asignar responsabilidades claras a ChatGPT, Work, Obsidian, la documentación y Git.
- **Prioridad:** P1
- **Prerequisitos:** identificar los tipos de conocimiento producidos por LinuxPC y sus necesidades de consulta.
- **Dependencias:** P1-01.
- **Duración estimada:** 1–2 sesiones.
- **Criterio de finalización:** cada herramienta tiene un propósito definido y se determina qué información debe terminar en artefactos permanentes.
- **Documentación relacionada:** [Contexto general](PROJECT_CONTEXT.md). No existe todavía documentación específica para esta arquitectura.
- **Riesgos:** duplicación, fragmentación o dependencia de conversaciones temporales.

## P1-17 — Ciclo de vida del conocimiento

- **Estado:** No iniciado
- **Objetivo:** definir cómo una idea, conversación, incidencia o decisión pasa a convertirse en conocimiento mantenible.
- **Prioridad:** P1
- **Prerequisitos:** arquitectura del conocimiento definida.
- **Dependencias:** P1-16.
- **Duración estimada:** 1–2 sesiones.
- **Criterio de finalización:** existen estados y criterios claros para capturar, validar, consolidar, revisar y retirar información.
- **Documentación relacionada:** [Contexto general](PROJECT_CONTEXT.md), [Instrucciones para agentes](../AGENTS.md) y [Dotfiles y Git](07-dotfiles-git.md).
- **Riesgos:** generar documentación excesiva o conservar información que no haya sido validada.

## P1-18 — Registro de decisiones e incidencias

- **Estado:** No iniciado
- **Objetivo:** preservar el razonamiento arquitectónico y el aprendizaje obtenido de fallos reales.
- **Prioridad:** P1
- **Prerequisitos:** ciclo de vida del conocimiento acordado.
- **Dependencias:** P1-17.
- **Duración estimada:** 1 sesión.
- **Criterio de finalización:** las decisiones e incidencias pueden registrar alcance, estado, causa, consecuencias y relación con el sistema actual.
- **Documentación relacionada:** [Contexto general](PROJECT_CONTEXT.md). No existe todavía un registro específico.
- **Riesgos:** convertir el registro en una cronología sin utilidad arquitectónica.

# Épica: IA y flujos con agentes

## P1-19 — Modelo de gobierno de IA

- **Estado:** No iniciado
- **Objetivo:** definir qué pueden investigar, proponer, modificar y verificar los agentes.
- **Prioridad:** P1
- **Prerequisitos:** fuente de verdad y ciclo de vida del conocimiento definidos.
- **Dependencias:** P1-01 y P1-17.
- **Duración estimada:** 1–2 sesiones.
- **Criterio de finalización:** existen límites claros de autoridad, revisión, privacidad, evidencia y finalización para el trabajo asistido por IA.
- **Documentación relacionada:** [Contexto general](PROJECT_CONTEXT.md) e [Instrucciones para agentes](../AGENTS.md).
- **Riesgos:** delegar acciones sensibles, exponer información privada o aceptar resultados sin verificación.

## P1-20 — Arquitectura de Work y contextos de agentes

- **Estado:** No iniciado
- **Objetivo:** estructurar los contextos utilizados por Work, ChatGPT y agentes especializados.
- **Prioridad:** P1
- **Prerequisitos:** modelo de gobierno de IA definido.
- **Dependencias:** P1-16 y P1-19.
- **Duración estimada:** 2 sesiones.
- **Criterio de finalización:** cada contexto o agente previsto tiene misión, entradas, salidas, límites y fuente documental definidos.
- **Documentación relacionada:** [Contexto general](PROJECT_CONTEXT.md) e [Instrucciones para agentes](../AGENTS.md). No existe todavía documentación específica para Work.
- **Riesgos:** contextos contradictorios, obsoletos o demasiado amplios.

## P1-21 — Flujo de desarrollo asistido por IA

- **Estado:** No iniciado
- **Objetivo:** integrar análisis, planificación, revisión y documentación asistidos por agentes en el flujo de LinuxPC.
- **Prioridad:** P1
- **Prerequisitos:** contrato de reconstrucción y gobierno de IA definidos.
- **Dependencias:** P1-05, P1-19 y P1-20.
- **Duración estimada:** 2 sesiones.
- **Criterio de finalización:** el ciclo de una tarea asistida tiene entradas, controles, evidencia y criterio de aceptación definidos.
- **Documentación relacionada:** [Contexto general](PROJECT_CONTEXT.md), [Instrucciones para agentes](../AGENTS.md) y [Dotfiles y Git](07-dotfiles-git.md).
- **Riesgos:** automatizar decisiones no estabilizadas o producir cambios correctos localmente pero incoherentes con el conjunto.

# Épica: Bazzite y sistemas secundarios

## P1-22 — Baseline de recuperación de Bazzite

- **Estado:** No iniciado
- **Objetivo:** comprender qué debe conservarse y qué puede reconstruirse en Bazzite.
- **Prioridad:** P1
- **Prerequisitos:** respaldo general validado y acceso al sistema Bazzite.
- **Dependencias:** P0-03 y P1-01.
- **Duración estimada:** 2 sesiones.
- **Criterio de finalización:** sistema base, datos de usuario, Flatpaks, configuración gaming y arranque tienen una estrategia de recuperación definida.
- **Documentación relacionada:** [Bazzite](06-bazzite.md), [Arranque y GRUB](03-grub.md), [HDD compartido](04-hdd-compartido.md) y [Recuperación](08-recuperacion.md).
- **Riesgos:** aplicar a un sistema inmutable supuestos propios de Arch Linux.

## P2-06 — Plataforma gaming de Bazzite

- **Estado:** No iniciado
- **Objetivo:** consolidar Steam, biblioteca compartida, mandos, emulación y compatibilidad.
- **Prioridad:** P2
- **Prerequisitos:** recuperación de Bazzite y arquitectura del HDD definidas.
- **Dependencias:** P1-14 y P1-22.
- **Duración estimada:** 2–3 sesiones.
- **Criterio de finalización:** el flujo gaming principal funciona y sus datos relevantes tienen recuperación definida.
- **Documentación relacionada:** [Bazzite](06-bazzite.md), [HDD compartido](04-hdd-compartido.md) y este roadmap.
- **Riesgos:** permisos en NTFS, rutas diferentes, compatibilidad de juegos o duplicación de datos.

## P2-07 — Multimedia y gaming avanzado

- **Estado:** No iniciado
- **Objetivo:** abordar grabación, edición, métricas y compatibilidad específica después de estabilizar el flujo gaming principal.
- **Prioridad:** P2
- **Prerequisitos:** plataforma gaming de Bazzite estable.
- **Dependencias:** P2-06.
- **Duración estimada:** 2–3 sesiones.
- **Criterio de finalización:** los casos de uso seleccionados funcionan sin comprometer la estabilidad de Arch Linux o Bazzite.
- **Documentación relacionada:** [Bazzite](06-bazzite.md) y este roadmap.
- **Riesgos:** optimizaciones específicas que aumenten el mantenimiento o el acoplamiento.

## P2-08 — Continuidad mínima de Windows

- **Estado:** No iniciado
- **Objetivo:** mantener Windows disponible únicamente para compatibilidad.
- **Prioridad:** P2
- **Prerequisitos:** HDD y arranque multisistema estables.
- **Dependencias:** P1-06 y P1-14.
- **Duración estimada:** 1 sesión.
- **Criterio de finalización:** Windows arranca, accede de forma segura a los datos compartidos y conserva su función de compatibilidad.
- **Documentación relacionada:** [Arquitectura](01-arquitectura.md), [Particiones](02-particiones.md), [Arranque y GRUB](03-grub.md) y [HDD compartido](04-hdd-compartido.md).
- **Riesgos:** inicio rápido de Windows, modificaciones de la EFI o alteraciones del volumen NTFS.

# Épica: Automatización

## P2-01 — Automatización de reconstrucción

- **Estado:** No iniciado
- **Objetivo:** reducir el trabajo manual necesario para reconstruir Arch Linux.
- **Prioridad:** P2
- **Prerequisitos:** contrato de reconstrucción estable.
- **Dependencias:** P1-05 y P1-21.
- **Duración estimada:** 2–3 sesiones.
- **Criterio de finalización:** el proceso automatizado satisface el contrato de reconstrucción y conserva puntos explícitos de revisión.
- **Documentación relacionada:** [Contexto general](PROJECT_CONTEXT.md), [Dotfiles y Git](07-dotfiles-git.md) y [Recuperación](08-recuperacion.md).
- **Riesgos:** ocultar operaciones, automatizar estado accidental o dificultar la reversión.

## P2-02 — Automatización de respaldo y mantenimiento

- **Estado:** No iniciado
- **Objetivo:** reducir la dependencia de tareas manuales repetitivas de respaldo y mantenimiento.
- **Prioridad:** P2
- **Prerequisitos:** respaldos y restauraciones manuales validados.
- **Dependencias:** P0-03 y P2-01.
- **Duración estimada:** 2–3 sesiones.
- **Criterio de finalización:** las tareas automatizadas tienen resultado verificable, fallos visibles y responsabilidad definida.
- **Documentación relacionada:** [Recuperación](08-recuperacion.md) y [Snapshots](10-snapshots-snapper.md).
- **Riesgos:** fallos silenciosos o eliminación automática de copias útiles.

## P2-03 — Verificación de estado y divergencias

- **Estado:** No iniciado
- **Objetivo:** detectar diferencias entre el estado previsto y el estado real de LinuxPC.
- **Prioridad:** P2
- **Prerequisitos:** inventarios y contrato de reconstrucción disponibles.
- **Dependencias:** P1-03, P1-04 y P1-05.
- **Duración estimada:** 2 sesiones.
- **Criterio de finalización:** las divergencias relevantes pueden identificarse de forma repetible y tienen un responsable de resolución.
- **Documentación relacionada:** [Contexto general](PROJECT_CONTEXT.md) y [Dotfiles y Git](07-dotfiles-git.md).
- **Riesgos:** exceso de alertas o validaciones demasiado rígidas.

# Épica: Apariencia

## P2-04 — Sistema visual de LinuxPC

- **Estado:** No iniciado
- **Objetivo:** definir identidad visual, tipografía, color, densidad y jerarquía para el entorno gráfico.
- **Prioridad:** P2
- **Prerequisitos:** infraestructura y productividad del escritorio estables.
- **Dependencias:** P1-11 y P1-12.
- **Duración estimada:** 1–2 sesiones.
- **Criterio de finalización:** existe un criterio visual común aplicable a los componentes del escritorio.
- **Documentación relacionada:** [Contexto general](PROJECT_CONTEXT.md) y [Arch Linux](05-arch-linux.md).
- **Riesgos:** priorizar coherencia estética sobre legibilidad, estabilidad o rendimiento.

## P2-05 — Consolidación visual de componentes

- **Estado:** No iniciado
- **Objetivo:** alinear Waybar, Rofi, Kitty, GTK, Btop, Fastfetch y el selector de ventanas.
- **Prioridad:** P2
- **Prerequisitos:** sistema visual de LinuxPC definido.
- **Dependencias:** P2-04.
- **Duración estimada:** 2–3 sesiones.
- **Criterio de finalización:** los componentes incluidos respetan el sistema visual y no presentan contradicciones funcionales.
- **Documentación relacionada:** [Arch Linux](05-arch-linux.md) y [Dotfiles y Git](07-dotfiles-git.md).
- **Riesgos:** dedicar esfuerzo a herramientas que posteriormente sean sustituidas.

# Épica: Rendimiento y portabilidad

## P2-09 — Rendimiento y portabilidad

- **Estado:** No iniciado
- **Objetivo:** evaluar estabilidad, consumo, rendimiento y capacidad de trasladar LinuxPC a otra máquina.
- **Prioridad:** P2
- **Prerequisitos:** automatización y verificación estabilizadas.
- **Dependencias:** P2-01 y P2-03.
- **Duración estimada:** 2 sesiones.
- **Criterio de finalización:** se conocen los principales cuellos de botella y las dependencias que impedirían reconstruir el entorno en otro equipo.
- **Documentación relacionada:** [Contexto general](PROJECT_CONTEXT.md) y [Arch Linux](05-arch-linux.md).
- **Riesgos:** optimización sin métricas o generalización prematura.

# Secuencia de ejecución por olas

Las olas expresan el orden recomendado. No representan un calendario rígido y no permiten iniciar un proyecto si sus dependencias no están completadas.

| Ola | Proyectos | Resultado esperado |
|---|---|---|
| 1 | P0-01 → P0-04 | Datos protegidos y recuperación permanente de Arch validada. |
| 2 | P1-01 → P1-06 | Fuente de verdad, inventarios y contrato de reconstrucción definidos. |
| 3 | P1-07 → P1-12 | Plataforma Arch y escritorio funcional estabilizados. |
| 4 | P1-13 → P1-18 | Productividad y gestión del conocimiento consolidadas. |
| 5 | P1-19 → P1-22 | Gobierno de IA, flujos con agentes y recuperación de Bazzite definidos. |
| 6 | P2-01 → P2-05 | Automatización, verificación y apariencia consolidadas. |
| 7 | P2-06 → P2-09 | Gaming, Windows mínimo, rendimiento y portabilidad revisados. |

## Regla operativa

La unidad de avance es un solo proyecto activo a la vez. Al terminar un proyecto se debe revisar el siguiente proyecto elegible según prioridad, dependencias y ola, en lugar de iniciar automáticamente el siguiente identificador.

## Revisión del roadmap

El roadmap debe revisarse cuando:

- cambien los objetivos o la prioridad entre sistemas;
- aparezca un riesgo que altere la secuencia prevista;
- un proyecto deje de ser independiente;
- una dependencia nueva impida comenzar un proyecto;
- el criterio de finalización resulte insuficiente o imposible de verificar;
- un proyecto pausado requiera cambiar su alcance;
- una decisión técnica modifique la arquitectura general.

Toda revisión debe conservar identificadores únicos. Un identificador completado no debe reutilizarse para otro propósito.
