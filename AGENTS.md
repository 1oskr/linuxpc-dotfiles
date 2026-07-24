# AGENTS.md

## Propósito

Este documento contiene las instrucciones operativas para los agentes de inteligencia artificial que colaboran en LinuxPC. Su objetivo es definir cómo debe trabajar un agente dentro de este repositorio y establecer el comportamiento esperado durante la colaboración.

Estas instrucciones complementan el contenido de `docs/PROJECT_CONTEXT.md` y no lo reemplazan. No describen la arquitectura del proyecto; establecen las reglas operativas que deben respetar los agentes durante toda la ejecución de una tarea.

## Alcance

Estas instrucciones se aplican a todo el repositorio, salvo que exista un archivo `AGENTS.md` más específico en un subdirectorio. En ese caso, el archivo ubicado en el subdirectorio tiene prioridad para los archivos contenidos dentro de su ámbito.

Cuando no exista una instrucción más específica, deben aplicarse las reglas definidas en este documento. Los agentes deben respetar simultáneamente las instrucciones del sistema, las instrucciones del usuario y las disposiciones de este archivo.

## Lecturas obligatorias

Antes de comenzar una tarea, el agente debe consultar, cuando resulte pertinente, `docs/PROJECT_CONTEXT.md`. Este documento constituye la referencia principal para comprender la arquitectura, los principios y los objetivos del proyecto. También debe revisar la documentación específica disponible para el área sobre la que vaya a trabajar.

La información ya documentada debe utilizarse como contexto para fundamentar las decisiones, sin duplicarla. Si el agente detecta documentación inconsistente, incompleta u obsoleta, debe indicarlo antes de introducir cambios que dependan de ella.

## Flujo de trabajo

Antes de actuar, el agente debe comprender el objetivo de la tarea y recopilar el contexto necesario para ejecutarla correctamente. Las decisiones deben fundamentarse en la documentación existente antes de proponer cambios nuevos.

Las modificaciones deben realizarse de forma incremental, priorizando cambios pequeños, coherentes y fáciles de revisar. Durante toda la tarea, el agente debe preservar la coherencia con las decisiones técnicas ya adoptadas en el proyecto.

Cuando exista incertidumbre que pueda afectar el resultado, el agente debe explicitar los supuestos realizados o solicitar las aclaraciones necesarias antes de continuar.

## Antes de modificar el proyecto

Antes de modificar cualquier archivo, el agente debe comprender el estado actual de la implementación y revisar la documentación pertinente. Debe identificar y reutilizar las configuraciones, los componentes y las soluciones existentes antes de crear alternativas nuevas.

Los cambios deben ser mínimos, reversibles y consistentes con el diseño del proyecto. El agente no debe reemplazar una implementación existente sin una justificación técnica clara basada en las necesidades de la tarea y en el contexto disponible.

Si detecta riesgos relevantes, dependencias o posibles efectos secundarios asociados con la modificación prevista, debe advertirlos antes de continuar.

## Implementación

Las implementaciones deben integrarse con la arquitectura existente y evitar introducir patrones innecesarios. El agente debe mantener un estilo consistente con el código y las convenciones ya presentes en el proyecto.

Las soluciones deben ser simples y mantenibles, y deben evitar la duplicación de lógica. Los cambios deben limitarse estrictamente al alcance de la tarea y no deben incluir refactorizaciones no relacionadas.

Cuando el agente identifique una mejora adicional conveniente que quede fuera del alcance de la tarea, debe mencionarla sin implementarla automáticamente.

## Documentación

La documentación debe mantenerse sincronizada con los cambios relevantes realizados en el repositorio. Siempre que sea posible, el agente debe actualizar la documentación existente antes de crear documentos nuevos y debe evitar duplicar información ya documentada.

Si una modificación afecta el comportamiento, la arquitectura o el flujo de trabajo del proyecto, el agente debe evaluar si corresponde actualizar la documentación asociada. La documentación debe reflejar de forma precisa el estado resultante del proyecto.

Cuando la documentación no se actualice después de un cambio relevante, el agente debe contar con una razón justificada para esa decisión.

## Git

El agente no debe realizar commits, pushes, merges, rebases ni otras operaciones que modifiquen el historial del repositorio, salvo que el usuario lo solicite explícitamente.

Antes de proponer modificaciones importantes en la documentación o en la estructura del proyecto, debe considerar el estado actual del repositorio y respetar el flujo de trabajo existente. Cualquier recomendación relacionada con Git debe ser coherente con el flujo de trabajo definido por el proyecto.

Cuando una tarea produzca cambios relevantes, el agente puede sugerir revisar `git status`, crear un commit o realizar un push, pero no debe ejecutar estas acciones por iniciativa propia.

## Restricciones

El agente no debe asumir requisitos, preferencias ni decisiones técnicas que no estén documentadas o indicadas por el usuario. Cuando no disponga de información suficiente para continuar de forma fiable, debe reconocer la incertidumbre y solicitar las aclaraciones necesarias.

Las modificaciones deben limitarse a las partes del proyecto necesarias para completar la tarea. El agente debe evitar introducir dependencias, herramientas o cambios de arquitectura sin una justificación técnica suficiente.

En todas sus decisiones, el agente debe priorizar la estabilidad, la mantenibilidad y la coherencia del proyecto por encima de cambios innecesarios.

## Antes de finalizar una tarea

Antes de dar una tarea por terminada, el agente debe verificar que el resultado sea coherente con el objetivo solicitado. También debe comprobar que los cambios sean consistentes con la documentación y con las decisiones existentes del proyecto.

El agente debe indicar cualquier limitación, supuesto pendiente o aspecto que no haya podido verificar. Cuando existan pasos posteriores recomendables, debe comunicarlos claramente sin ejecutarlos automáticamente.

La respuesta final debe describir con precisión el estado de la tarea y proporcionar la información necesaria para que el usuario pueda decidir el siguiente paso.
