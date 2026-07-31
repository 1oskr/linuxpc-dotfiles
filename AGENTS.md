# AGENTS.md

## Propósito

Este documento contiene las instrucciones operativas para los agentes de inteligencia artificial que colaboran en LinuxPC. Su objetivo es definir cómo debe trabajar un agente dentro de este repositorio y establecer el comportamiento esperado durante la colaboración.

Estas instrucciones complementan `LINUXPC_INSTRUCTIONS.md` y `docs/PROJECT_CONTEXT.md`. No describen por sí solas la arquitectura completa del proyecto; establecen las reglas operativas que deben respetar los agentes durante una tarea.

## Jerarquía de instrucciones

Durante cualquier tarea deben aplicarse, en este orden:

1. instrucciones explícitas del usuario;
2. `LINUXPC_INSTRUCTIONS.md`;
3. el `AGENTS.md` más específico aplicable;
4. la Skill aplicable dentro de `.agents/skills/`;
5. `docs/PROJECT_CONTEXT.md`;
6. documentación técnica y configuración vigente del repositorio;
7. convenciones generales de las herramientas.

Antes de actuar, el agente debe consultar `LINUXPC_INSTRUCTIONS.md` y respetar sus límites de alcance, seguridad, verificación y control de cambios.

## Alcance

Estas instrucciones se aplican a todo el repositorio, salvo que exista un archivo `AGENTS.md` más específico en un subdirectorio. En ese caso, el archivo ubicado en el subdirectorio tiene prioridad para los archivos contenidos dentro de su ámbito.

Cuando no exista una instrucción más específica, deben aplicarse las reglas definidas en este documento.

## Uso de Skills

Las Skills propias de LinuxPC se encuentran exclusivamente en:

```text
.agents/skills/<nombre-de-la-skill>/SKILL.md
```

El agente debe seleccionar la Skill cuyo alcance coincida mejor con la tarea y leer su `SKILL.md` antes de ejecutarla.

No debe combinar Skills innecesariamente, ampliar el alcance solicitado ni considerar como Skills del proyecto archivos ubicados fuera de `.agents/skills/`, salvo indicación explícita del usuario.

### Skills disponibles

- `arch-diagnose`: diagnóstico de problemas de Arch Linux basado en evidencia.
- `document-linuxpc`: actualización exclusiva de documentación.
- `dotfiles-architect`: revisión estructural del repositorio, reproducibilidad y fuentes de verdad.
- `hyprland-designer`: mejoras acotadas de Hyprland y la interfaz gráfica.
- `linuxpc-planner`: priorización y planificación del siguiente trabajo.
- `maintain-linuxpc`: mantenimiento general y acotado de LinuxPC.
- `recovery-auditor`: auditoría de recuperación, respaldos y restauración.
- `review-linuxpc`: revisión de cambios locales antes de un commit.

Las Skills no sustituyen la jerarquía de instrucciones ni autorizan operaciones fuera de su alcance.

Cuando una tarea sea únicamente de inspección, auditoría, diagnóstico o planificación, el agente no debe modificar archivos ni el sistema.

## Lecturas obligatorias

Antes de comenzar una tarea, el agente debe consultar:

1. `LINUXPC_INSTRUCTIONS.md`;
2. este archivo;
3. el `SKILL.md` seleccionado, cuando corresponda;
4. `docs/PROJECT_CONTEXT.md`;
5. la documentación específica del área afectada.

La información ya documentada debe utilizarse como contexto para fundamentar las decisiones, sin duplicarla.

Si el agente detecta documentación inconsistente, incompleta u obsoleta, debe indicarlo antes de introducir cambios que dependan de ella.

## Flujo de trabajo

Antes de actuar, el agente debe comprender el objetivo de la tarea y recopilar el contexto necesario para ejecutarla correctamente.

Las decisiones deben fundamentarse en:

- la documentación existente;
- el estado real del repositorio;
- el estado efectivo del sistema, cuando corresponda;
- evidencia verificable obtenida durante la tarea.

Las modificaciones deben realizarse de forma incremental, priorizando cambios pequeños, coherentes, reversibles y fáciles de revisar.

Cuando exista incertidumbre que pueda afectar el resultado, el agente debe explicitar los supuestos realizados o solicitar aclaraciones antes de continuar.

## Antes de modificar el proyecto

Antes de modificar cualquier archivo, el agente debe:

1. comprender el estado actual de la implementación;
2. revisar la documentación pertinente;
3. inspeccionar los archivos o configuraciones involucrados;
4. revisar el estado de Git;
5. identificar riesgos, dependencias y posibles efectos secundarios.

Debe reutilizar las configuraciones, componentes y soluciones existentes antes de crear alternativas nuevas.

No debe reemplazar una implementación existente sin una justificación técnica clara.

## Implementación

Las implementaciones deben integrarse con la arquitectura existente y evitar introducir patrones innecesarios.

Las soluciones deben ser:

- simples;
- mantenibles;
- reversibles cuando sea posible;
- coherentes con las convenciones existentes;
- limitadas estrictamente al alcance de la tarea.

No deben incluirse refactorizaciones, limpiezas o mejoras no relacionadas con la unidad de trabajo actual.

Cuando el agente identifique una mejora adicional conveniente, debe mencionarla sin implementarla automáticamente.

## Verificación

Todo cambio debe verificarse mediante la comprobación más pequeña y significativa disponible.

La verificación puede incluir:

- validación de sintaxis;
- revisión de diferencias;
- ejecución de un comando específico;
- comprobación de un servicio;
- recarga controlada de una configuración;
- confirmación observable del comportamiento esperado.

El agente no debe declarar una tarea como completada si el resultado no fue verificado o si quedan comprobaciones importantes pendientes.

## Documentación

La documentación debe mantenerse sincronizada con los cambios relevantes realizados en el repositorio o en el sistema.

Siempre que sea posible, el agente debe actualizar documentación existente antes de crear documentos nuevos.

La documentación debe distinguir claramente entre estados:

- implementado;
- probado;
- pendiente;
- planificado.

No debe documentarse como efectivo un comportamiento que solo haya sido propuesto o configurado sin verificar.

## Git

El agente no debe realizar commits, pushes, merges, rebases ni otras operaciones que modifiquen el historial del repositorio, salvo que el usuario lo solicite explícitamente.

Antes de proponer un commit debe comprobar, cuando corresponda:

- `git status --short --branch`;
- `git diff --check`;
- `git diff`;
- `git diff --cached`;
- las validaciones específicas de los archivos modificados.

El agente puede sugerir crear un commit o realizar un push, pero no debe ejecutarlos por iniciativa propia.

## Seguridad

El agente debe priorizar soluciones reversibles y de bajo riesgo.

No debe:

- ejecutar acciones destructivas sin autorización explícita;
- modificar particiones, sistemas de archivos, EFI, GRUB o respaldos sin autorización;
- eliminar archivos de forma amplia;
- sobrescribir configuraciones sin inspeccionarlas;
- almacenar contraseñas, claves privadas, tokens u otros secretos en el repositorio;
- presentar supuestos como hechos verificados.

Cuando una acción pueda afectar el arranque, almacenamiento, recuperación o disponibilidad del sistema, debe advertir el riesgo antes de continuar.

## Restricciones

Las modificaciones deben limitarse a las partes necesarias para completar la tarea.

El agente debe evitar introducir:

- dependencias innecesarias;
- herramientas redundantes;
- abstracciones sin utilidad concreta;
- configuraciones paralelas;
- nuevas fuentes de verdad;
- acoplamiento innecesario con una máquina específica.

La estabilidad, mantenibilidad, reproducibilidad y comprensión del sistema tienen prioridad sobre cambios estéticos o conveniencias temporales.

## Antes de finalizar una tarea

Antes de dar una tarea por terminada, el agente debe confirmar:

- que el resultado coincide con el objetivo solicitado;
- que el alcance se mantuvo acotado;
- que el resultado fue verificado;
- que los riesgos relevantes fueron considerados;
- que la documentación necesaria fue evaluada;
- que no se realizaron operaciones Git no autorizadas;
- que se indicaron claramente los puntos pendientes o no verificables.

La respuesta final debe describir con precisión el estado real de la tarea y permitir que el usuario decida el siguiente paso.
