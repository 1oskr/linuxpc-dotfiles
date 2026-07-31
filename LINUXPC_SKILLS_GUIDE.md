# Guía de Skills de LinuxPC

## Propósito

Esta guía resume cómo seleccionar y utilizar las Skills disponibles para trabajar en LinuxPC. No sustituye las instrucciones generales, `AGENTS.md` ni los `SKILL.md`; sirve como índice operativo y conserva sus límites de alcance.

## Ubicación canónica

Las Skills propias del proyecto se encuentran exclusivamente en:

```text
.agents/skills/<nombre-de-la-skill>/SKILL.md
```

La guía refleja las ocho Skills existentes actualmente:

```text
arch-diagnose
document-linuxpc
dotfiles-architect
hyprland-designer
linuxpc-planner
maintain-linuxpc
recovery-auditor
review-linuxpc
```

## Jerarquía aplicable

En cada tarea se aplica este orden:

1. instrucciones explícitas del usuario;
2. `LINUXPC_INSTRUCTIONS.md`;
3. el `AGENTS.md` más específico aplicable;
4. la Skill aplicable dentro de `.agents/skills/`;
5. `docs/PROJECT_CONTEXT.md`;
6. documentación técnica y configuración vigente del repositorio;
7. convenciones generales de las herramientas.

La Skill no sustituye las instrucciones superiores y no autoriza operaciones fuera de su alcance. Debe identificarse y leerse completa antes de actuar. `LINUXPC_SKILLS_GUIDE.md` es solo una guía orientativa y no sustituye el `SKILL.md`.

## Regla rápida de selección

- Problema activo de Arch, servicios, arranque, sesión o hardware: `arch-diagnose`.
- Documentación únicamente: `document-linuxpc`.
- Arquitectura de dotfiles, fuentes de verdad o reproducibilidad estructural: `dotfiles-architect`.
- Una mejora concreta de Hyprland o de la interfaz: `hyprland-designer`.
- Priorización o división del siguiente trabajo: `linuxpc-planner`.
- Mantenimiento general que combine sistema, configuración y documentación: `maintain-linuxpc`.
- Recuperación, respaldos, GRUB, EFI, Btrfs o restauración: `recovery-auditor`.
- Revisión de cambios locales antes de commit: `review-linuxpc`.

Cuando haya solapamiento, se selecciona la Skill más estrecha. No se combinan Skills innecesariamente.

## Función y casos habituales

### `arch-diagnose`

Diagnostica problemas de Arch Linux a partir del estado real, registros, servicios, paquetes, sesiones, dispositivos y configuración. Separa síntomas, hechos, hipótesis, pruebas y causa probable. No aplica correcciones por defecto.

### `document-linuxpc`

Actualiza documentación de LinuxPC después de verificar el estado subyacente. Mantiene inventarios, contratos, índices y documentos canónicos sin cambiar configuración ni sistema.

### `dotfiles-architect`

Revisa la arquitectura del repositorio y de los dotfiles: límites, fuentes de verdad, duplicación, dependencias ocultas, acoplamiento a la máquina, reproducibilidad y mantenibilidad. Analiza y propone unidades acotadas antes de cualquier cambio estructural.

### `hyprland-designer`

Realiza una mejora verificable y acotada de Hyprland, Waybar, Rofi, Kitty, wallpapers u otra UX visual relacionada. Conserva rendimiento, estilo, compatibilidad y separación entre configuración común y específica de máquina.

### `linuxpc-planner`

Selecciona el siguiente trabajo de mayor impacto revisando roadmap, contexto, Git, dependencias y bloqueos. Divide proyectos grandes en unidades verificables y entrega el siguiente paso sin modificar archivos ni sistema.

### `maintain-linuxpc`

Coordina mantenimiento general de LinuxPC cuando el trabajo puede involucrar Arch, Hyprland, dotfiles, reproducibilidad, herramientas, recuperación o documentación. Exige un alcance único, inspección previa, cambio mínimo y verificación concreta.

### `recovery-auditor`

Audita snapshots, Btrfs, respaldos, restauración, GRUB y EFI. Distingue entre respaldo existente, procedimiento documentado, restauración probada y restauración verificada recientemente. Inspecciona primero en modo lectura y no repara sistemas de arranque ni ejecuta restauraciones.

### `review-linuxpc`

Revisa cambios locales antes de commit mediante estado, diff, espacios en blanco, validaciones, regresiones, documentación faltante y preparación del commit. No modifica archivos ni crea commits.

## Límites y solapamientos

Todas las Skills tienen límites comunes: no usan `sudo`, no hacen commit, push, merge, rebase ni reescritura de historial, y no ejecutan operaciones destructivas o de alto riesgo sin autorización explícita.

Las separaciones principales son:

- `arch-diagnose` diagnostica incidentes; `maintain-linuxpc` mantiene una unidad general; `review-linuxpc` revisa diffs.
- `recovery-auditor` audita recuperación; no repara GRUB, particiones, EFI, Btrfs ni respaldos.
- `document-linuxpc` documenta; no implementa cambios de sistema ni dotfiles.
- `dotfiles-architect` analiza estructura; no refactoriza por defecto.
- `linuxpc-planner` prioriza y divide trabajo; no implementa ni documenta.
- `hyprland-designer` se limita a una mejora de escritorio; no sustituye un diagnóstico general ni una revisión arquitectónica.

## Flujos recomendados

### Diagnóstico

1. Seleccionar `arch-diagnose`.
2. Leer instrucciones, Skill y documentación canónica.
3. Inspeccionar el estado real sin cambiarlo.
4. Separar hechos, hipótesis y pruebas.
5. Proponer una corrección solo cuando la evidencia reduzca la incertidumbre.

### Cambio acotado

1. Confirmar el alcance y revisar Git.
2. Seleccionar `maintain-linuxpc`, `hyprland-designer` u otra Skill específica.
3. Inspeccionar implementación, dependencias y límites.
4. Aplicar el cambio mínimo y reversible.
5. Ejecutar la validación más pequeña y significativa.
6. Evaluar documentación, rollback y reproducibilidad.

### Documentación

1. Seleccionar `document-linuxpc`.
2. Confirmar el documento canónico y la evidencia disponible.
3. Documentar únicamente el estado comprobado.
4. Distinguir implementado, probado, pendiente y planificado.
5. Revisar diff, estado y coherencia con las fuentes relacionadas.

### Recuperación

1. Seleccionar `recovery-auditor`.
2. Definir la superficie: snapshots, filesystem, arranque, respaldo o procedimiento.
3. Inspeccionar en modo lectura.
4. Separar cobertura, ruta de restauración, evidencia, brechas y riesgo.
5. Proponer la siguiente prueba segura sin ejecutarla automáticamente.

### Planificación y revisión

Para elegir el siguiente trabajo, usar `linuxpc-planner`; para revisar cambios locales antes de commit, usar `review-linuxpc`. Ambas tareas son de inspección y no deben modificar el repositorio.

## Reglas comunes de seguridad

- No usar `sudo`.
- No modificar particiones, EFI, GRUB, NVRAM, Btrfs o respaldos sin autorización.
- No instalar ni eliminar paquetes fuera del alcance autorizado.
- No sobrescribir cambios locales no relacionados.
- Preferir operaciones reversibles y de bajo riesgo.
- No guardar contraseñas, tokens, claves privadas ni otros secretos en Git.
- No presentar hipótesis o propuestas como hechos verificados.
- Comprobar el estado real y no asumir que un comando funcionó.
- Detenerse y reportar la limitación si una comprobación requiere privilegios.
- No hacer commit ni push por iniciativa propia.

## Plantilla general para Codex

```text
Objetivo y alcance:

Skill utilizada:

Instrucciones y documentación leídas:

Estado comprobado:

Hipótesis o incertidumbres:

Cambios autorizados:

Validación ejecutada:

Documentación afectada:

Riesgos, reversión y pendientes:

Estado final de Git:
```

En inspecciones, planificaciones y auditorías, la sección de cambios debe indicar que no hubo modificaciones.

## Vacíos actuales de cobertura

Las Skills existentes no incluyen una Skill especializada independiente para:

- administración específica de Windows o macOS;
- ejecución de reparación de GRUB, EFI, NVRAM, particiones o Btrfs;
- implementación exclusiva de un procedimiento de respaldos o restauración;
- una revisión general de seguridad fuera de los límites de las Skills actuales.

Estos son límites de cobertura actuales, no funcionalidades implementadas ni trabajos iniciados.

## Criterio para crear Skills futuras

Una Skill futura debe crearse solo cuando exista un flujo repetible y claramente delimitado que no quede cubierto adecuadamente por una Skill existente. Debe tener:

- un propósito único;
- criterios explícitos de activación;
- lectura canónica definida;
- procedimiento verificable;
- límites y solapamientos documentados;
- reglas de seguridad y reversión proporcionales al riesgo;
- una ubicación dentro de `.agents/skills/<nombre>/SKILL.md`.

Antes de crearla se debe comprobar si basta con ampliar una Skill existente. La nueva Skill no debe introducir una fuente de verdad paralela, duplicar reglas generales ni autorizar operaciones que las instrucciones del proyecto prohíben.
