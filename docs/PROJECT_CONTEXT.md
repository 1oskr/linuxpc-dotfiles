# LinuxPC

## Propósito

LinuxPC es un proyecto de ingeniería personal cuyo objetivo es diseñar, construir y mantener un sistema operativo completamente comprendido por su propietario. No se concibe como una instalación de Linux terminada, sino como un sistema vivo que evolucionará continuamente a medida que aumenten los conocimientos y la experiencia, y cambien las necesidades.

El proyecto persigue el aprendizaje profundo de sistemas operativos, administración de sistemas, automatización, programación, infraestructura y herramientas de desarrollo mediante la resolución de problemas reales sobre el propio entorno de trabajo.

Cada decisión técnica debe responder a un propósito claro. Cada modificación importante debe ser reproducible, documentada y, cuando sea posible, reversible. El sistema debe poder mantenerse, reconstruirse y evolucionar sin depender de configuraciones opacas ni de conocimiento implícito.

LinuxPC constituye además el entorno principal de trabajo para estudio, investigación, programación, matemáticas e ingeniería. La personalización del sistema no es un fin en sí mismo, sino una consecuencia del conocimiento adquirido y de la mejora continua del entorno.

## Filosofía

Las decisiones del proyecto deben partir de la comprensión de los mecanismos involucrados. Antes de incorporar una configuración, herramienta o procedimiento, se debe conocer su función, sus dependencias, sus efectos y sus límites. Las soluciones existentes sirven como referencia, pero no sustituyen el análisis propio ni justifican la adopción de elementos que no puedan explicarse y mantenerse.

La estabilidad operativa tiene prioridad sobre la apariencia y la simplicidad prevalece sobre la complejidad innecesaria. Se prefieren componentes con responsabilidades claras, comportamientos predecibles y superficies de fallo reducidas. La personalización debe resolver una necesidad concreta, mejorar un flujo de trabajo o facilitar la comprensión del sistema; no debe introducirse únicamente por novedad, tendencia o valor estético.

Los cambios importantes deben poder reproducirse y estar acompañados por documentación suficiente para comprender su motivación, alcance y procedimiento de aplicación. Siempre que sea técnicamente viable, las modificaciones deben admitir una reversión definida y segura. Esta disciplina permite experimentar sin convertir el estado del sistema en una sucesión de cambios irreconocibles o difíciles de deshacer.

El aprendizaje se produce mediante la investigación y resolución de problemas reales. Las incidencias, limitaciones y nuevas necesidades se consideran oportunidades para ampliar el conocimiento técnico, siempre sin comprometer deliberadamente la confiabilidad del entorno. La automatización se incorpora cuando reduce errores, elimina repeticiones significativas o mejora la mantenibilidad; no se utiliza para ocultar procesos que aún no se comprenden ni para sustituir procedimientos simples y suficientes.

Se favorecen estándares abiertos, interfaces conocidas y convenciones ampliamente comprendidas antes que soluciones ad hoc. Las excepciones deben responder a restricciones verificables y quedar justificadas. Esta preferencia reduce el acoplamiento, facilita la interoperabilidad y conserva la capacidad de sustituir componentes sin rediseñar innecesariamente el conjunto.

La evolución del sistema se entiende como un proceso continuo de largo plazo. Las mejoras deben introducirse de manera incremental, evaluando sus resultados y revisando decisiones anteriores cuando cambien los requisitos o aumente el conocimiento disponible. Ninguna decisión técnica se considera definitiva: su permanencia depende de que continúe siendo comprensible, estable y adecuada para el proyecto.

## Objetivos

Arch Linux debe mantenerse como el sistema principal de trabajo y como la plataforma central para el desarrollo técnico del proyecto. Bazzite y Windows deben conservarse como sistemas complementarios destinados a juegos, compatibilidad con software y hardware específico, y pruebas en entornos con requisitos diferentes. La coexistencia de estos sistemas debe ampliar las capacidades disponibles sin fragmentar la administración general del equipo.

El entorno debe poder reconstruirse de manera predecible a partir de dotfiles, scripts y documentación mantenidos en conjunto. La configuración declarada y automatizada debe abarcar progresivamente los componentes relevantes para reducir la dependencia de ajustes manuales difíciles de identificar, repetir o trasladar. El repositorio debe consolidarse como la fuente de verdad técnica del proyecto y reflejar con suficiente fidelidad el estado previsto de sus sistemas, herramientas, configuraciones y procedimientos.

La evolución técnica debe mejorar de forma continua la productividad, el rendimiento, la estabilidad y la mantenibilidad del entorno. Su arquitectura debe permanecer modular, con límites claros entre componentes y dependencias controladas, para permitir que herramientas, servicios o configuraciones puedan sustituirse sin rehacer el sistema completo. Esta estructura debe facilitar cambios incrementales y evitar que una elección local condicione innecesariamente el resto del entorno.

Los cambios importantes deben poder verificarse, versionarse y recuperarse mediante mecanismos adecuados a su alcance. Las decisiones relevantes deben registrarse junto con el contexto necesario para comprender sus consecuencias y revisar su vigencia, evitando que la continuidad del proyecto dependa de la memoria o de conocimiento implícito. El trabajo realizado debe contribuir, además, al desarrollo de conocimientos profundos en Linux, automatización, programación, redes, almacenamiento y recuperación de sistemas.

## Estado actual

LinuxPC se encuentra en una etapa funcional y de evolución activa. El proyecto dispone de una arquitectura base suficientemente estable que sostiene el uso cotidiano y permite desarrollar mejoras incrementales sin alterar innecesariamente el conjunto. El trabajo actual se concentra en consolidar esa base y delimitar con mayor precisión sus componentes y relaciones.

La configuración principal está organizada mediante dotfiles versionados, y la documentación se está integrando progresivamente como una parte estructural del proyecto. En esta etapa se priorizan la estabilización y el registro del estado existente antes de incorporar nuevas funcionalidades, con el fin de reducir incertidumbre y conservar una referencia técnica coherente.

La recuperación, la reproducibilidad y la mantenibilidad ya forman parte de la operación actual, aunque sus mecanismos continúan perfeccionándose y ampliando su cobertura. La arquitectura no se considera cerrada: permanece abierta a revisiones y cambios cuando exista una mejora justificada, verificable y compatible con la continuidad del sistema.

## Hardware

El hardware constituye la plataforma física sobre la que se desarrolla y opera LinuxPC. Su función condiciona la capacidad de procesamiento, la disponibilidad del sistema, la compatibilidad con los distintos entornos y las posibilidades de evolución de la arquitectura. Por esta razón, debe considerarse una parte integral de la infraestructura técnica y no únicamente un conjunto de dispositivos independientes.

La selección y configuración del hardware deben mantener un equilibrio entre rendimiento, estabilidad, compatibilidad y mantenibilidad. El proyecto procura utilizar de manera eficiente los recursos disponibles, identificar sus límites reales y optimizar su aprovechamiento antes de plantear la sustitución de componentes. Las decisiones relacionadas con el hardware deben atender al comportamiento del sistema completo y no basarse exclusivamente en mejoras aisladas.

Las ampliaciones futuras deben planificarse en relación con la arquitectura existente y con los objetivos generales del proyecto. Cada incorporación debe evaluarse por su compatibilidad, su impacto operativo, sus requisitos de integración y su capacidad para aportar una mejora sostenible sin introducir dependencias o complejidad desproporcionadas.

## Sistemas operativos

LinuxPC se basa en una arquitectura multisistema en la que cada sistema operativo cumple una función específica dentro del proyecto. Los distintos entornos se conciben como partes coordinadas del conjunto y no como instalaciones independientes sin relación entre sí.

Las responsabilidades de cada sistema deben permanecer claramente delimitadas para evitar solapamientos innecesarios y mantener un criterio definido para la asignación de cargas de trabajo. La interoperabilidad y el intercambio controlado de información entre entornos constituyen objetivos de diseño, por lo que deben contemplarse mecanismos coherentes para compartir datos y mantener la continuidad de los flujos de trabajo.

Las decisiones relativas a un sistema operativo deben evaluarse también por su impacto sobre el conjunto de la infraestructura, incluidas sus dependencias, puntos de integración y efectos sobre los demás entornos. Las subsecciones siguientes describen el propósito y las características particulares de cada sistema dentro de esta arquitectura.

### Arch Linux

Arch Linux constituye el entorno principal de trabajo de LinuxPC y el punto central de su operación cotidiana. Sobre esta plataforma se elaboran, validan y consolidan la mayoría de las decisiones técnicas antes de incorporarlas como parte estable de la arquitectura.

Su función combina el uso productivo con el aprendizaje profundo de Linux, administración de sistemas, automatización y desarrollo. La elección de esta plataforma prioriza el control, la comprensión y la capacidad de configuración por encima de la simplicidad inicial, lo que exige conocer y mantener de forma consciente los elementos que integran el sistema.

Las modificaciones relevantes deben introducirse de manera planificada, documentada y verificable, con criterios que permitan evaluar tanto su resultado inmediato como su efecto operativo. Arch Linux debe evolucionar de forma continua para responder a nuevas necesidades, preservando al mismo tiempo la estabilidad y la mantenibilidad necesarias para sostener su función principal.

### Bazzite

Bazzite constituye un entorno complementario especializado dentro de LinuxPC. Su función principal es proporcionar una plataforma optimizada para videojuegos, multimedia y software cuya integración resulte más conveniente en ella, manteniendo estas cargas de trabajo diferenciadas de las responsabilidades asignadas al sistema principal.

Esta separación permite aislar requisitos y configuraciones específicas sin afectar la operación cotidiana del entorno principal. Bazzite sirve además como plataforma para evaluar tecnologías vinculadas con el ecosistema de juegos en Linux y otros casos de uso concretos que requieran un contexto operativo distinto.

La integración de Bazzite debe preservar la interoperabilidad con el resto de la arquitectura y facilitar el acceso controlado a la información compartida, sin duplicar funciones que correspondan al sistema principal. Su evolución debe permanecer alineada con la organización y los principios generales del proyecto, de modo que su especialización no introduzca fragmentación ni dependencias innecesarias.

### Windows

Windows constituye un entorno complementario orientado principalmente a la compatibilidad. Su función principal es proporcionar una plataforma para la utilización de software, hardware y servicios cuya integración no resulte viable o conveniente en los demás sistemas del proyecto, cubriendo requisitos específicos sin trasladarlos al entorno principal.

La disponibilidad de Windows facilita la validación del comportamiento de aplicaciones y flujos de trabajo en un entorno ampliamente utilizado. Su presencia responde a necesidades técnicas y prácticas definidas y no implica una duplicación de las responsabilidades asignadas al sistema principal.

Windows debe mantenerse integrado con la arquitectura general de LinuxPC, compartiendo información cuando resulte apropiado y respetando la organización establecida para el conjunto. Las modificaciones relevantes realizadas en este entorno deben documentarse cuando alteren interfaces, datos compartidos, procedimientos o cualquier otro elemento de la infraestructura del proyecto.

### macOS

macOS constituye un entorno de trabajo complementario orientado al acceso remoto, la administración y el desarrollo de LinuxPC. Su función principal es proporcionar un entorno desde el cual gestionar el proyecto sin depender del acceso físico al equipo principal y dar continuidad a distancia a las tareas técnicas.

Desde macOS se pueden realizar labores de edición de documentación, control del repositorio, revisión de configuraciones y otras actividades de mantenimiento. Aunque no actúa como entorno principal de ejecución, forma parte de la infraestructura de desarrollo y debe integrarse de manera coherente con los procesos que sostienen el proyecto.

La interacción entre macOS y LinuxPC debe establecerse mediante mecanismos estables, seguros y documentados. Las herramientas y los procedimientos utilizados desde este entorno deben respetar la organización definida y permanecer alineados con los principios generales del proyecto, evitando flujos paralelos o dependencias que dificulten su mantenimiento.

## Organización del almacenamiento

El almacenamiento de LinuxPC se organiza de acuerdo con responsabilidades claramente diferenciadas. Los datos propios de los sistemas, la configuración, los proyectos, la documentación, los respaldos y la información compartida deben mantenerse claramente delimitados cuando esta separación facilite su administración y reduzca dependencias innecesarias.

La organización lógica debe favorecer las tareas de mantenimiento, recuperación y evolución del proyecto. Su estructura debe minimizar el acoplamiento entre sistemas operativos, de manera que la modificación, reconstrucción o sustitución de un entorno no afecte datos ajenos a su ámbito ni condicione innecesariamente a los demás.

Los datos compartidos deben gestionarse mediante mecanismos definidos, con criterios claros de acceso, propiedad y sincronización que eviten duplicaciones innecesarias y estados divergentes. La distribución del almacenamiento debe poder adaptarse a nuevas capacidades o requisitos sin alterar la arquitectura general del proyecto ni modificar el significado de sus distintas áreas.

## Arquitectura del repositorio

El repositorio constituye la representación documental y la fuente de verdad técnica de LinuxPC. En él se centralizan la configuración, la documentación y los recursos necesarios para reconstruir, mantener y comprender el proyecto como un conjunto organizado.

Su organización debe reflejar la arquitectura lógica del sistema y responder a relaciones funcionales estables, sin depender de preferencias circunstanciales. Cada elemento debe tener una responsabilidad claramente definida y ocupar una posición coherente con su función, de forma que sea posible identificar su alcance y sus vínculos con el resto del proyecto.

La estructura debe favorecer la navegación, el mantenimiento, la reutilización y la evolución progresiva de sus contenidos. La incorporación de nuevos componentes debe preservar la coherencia general del repositorio, respetar los límites existentes y evitar duplicaciones, responsabilidades superpuestas o estructuras ambiguas.

## Flujo Git

Git constituye el mecanismo principal para gestionar la evolución de LinuxPC. Los cambios relevantes deben quedar registrados de manera que sea posible rastrear su origen, su motivación y su relación con el estado anterior del proyecto. Esta trazabilidad permite comprender cómo se alcanzó una configuración determinada y evaluar con precisión las consecuencias de modificarla.

Los commits deben representar unidades coherentes de trabajo, con un alcance suficientemente definido para facilitar su revisión, verificación y recuperación. El historial resultante forma parte de la documentación técnica del proyecto y debe conservar una secuencia comprensible de decisiones y transformaciones. Cuando resulte conveniente, las ramas deben aislar cambios en fase de desarrollo o de experimentación para preservar la estabilidad de la rama principal hasta que su integración sea adecuada.

La sincronización con el repositorio remoto contribuye a la conservación y continuidad del proyecto ante la pérdida o indisponibilidad de una copia local, pero no sustituye otras estrategias de respaldo. En conjunto, el flujo de trabajo con Git debe favorecer la reproducibilidad de los estados registrados, la revisión de las modificaciones y la recuperación controlada de cambios.

## Flujo de trabajo con Codex

Codex forma parte del flujo de trabajo de LinuxPC como asistente de ingeniería y desarrollo. Su participación comprende el análisis de problemas, la investigación técnica, la elaboración de propuestas y el apoyo a la implementación, mientras que la responsabilidad sobre las decisiones técnicas y su incorporación definitiva al proyecto permanece en el propietario.

El trabajo debe partir de instrucciones explícitas, de la documentación vigente y de los principios previamente definidos. Las propuestas generadas deben exponer un alcance comprensible, admitir revisión y justificación, y ser compatibles con la arquitectura existente. Cuando falte información relevante o una acción exceda el contexto establecido, la incertidumbre debe hacerse visible antes de introducir modificaciones.

El uso de Codex debe reducir tareas repetitivas, acelerar la investigación y facilitar implementaciones controladas, sin sustituir la comprensión de los mecanismos involucrados. Las modificaciones relevantes realizadas con su ayuda deben incorporarse al flujo habitual de documentación, revisión y control de versiones, bajo los mismos criterios aplicables al resto del trabajo técnico.

La colaboración debe ser reproducible y transparente. Las instrucciones, decisiones y resultados necesarios para comprender un cambio deben quedar representados en los artefactos permanentes del proyecto, de modo que su origen y razonamiento puedan revisarse posteriormente sin depender del contexto temporal de una sesión de trabajo.

## Dotfiles

Los dotfiles constituyen la representación declarativa del estado de configuración previsto para LinuxPC. Centralizan aquella configuración cuya conservación resulta relevante para la operación, reconstrucción y continuidad del proyecto, y permiten distinguir el estado previsto del sistema de las variaciones circunstanciales presentes en una instalación concreta.

Su contenido debe permitir reconstruir el entorno de manera coherente, reproducible y verificable. La organización interna debe reflejar la arquitectura lógica del sistema, mantener una separación clara entre componentes y conservar relaciones explícitas entre configuraciones y responsabilidades. Este criterio debe facilitar tanto la reutilización parcial como la sustitución de elementos sin introducir dependencias innecesarias.

Las modificaciones de configuración deben incorporarse de forma consciente, documentada y compatible con la evolución del proyecto. El mantenimiento de los dotfiles debe reducir al mínimo las configuraciones relevantes que permanezcan sin versionar o dependan exclusivamente del estado local, y debe favorecer la claridad, la reutilización y la continuidad del entorno a largo plazo.

## Hyprland

Hyprland constituye la interfaz principal mediante la que se utiliza Arch Linux dentro de LinuxPC. Su configuración forma parte de la arquitectura general del proyecto y debe responder a las necesidades del entorno de trabajo completo, en lugar de tratarse como una personalización aislada.

El entorno debe priorizar la productividad, la claridad operativa, la estabilidad y la mantenibilidad por encima de los efectos visuales o de la complejidad innecesaria. Su apariencia debe responder a criterios de coherencia, ergonomía, utilidad y mantenibilidad, y conservar una identidad visual consistente que facilite la lectura, la orientación y el uso cotidiano.

Los componentes que integran el entorno gráfico deben permanecer desacoplados y tener responsabilidades claramente definidas, de modo que puedan mantenerse o sustituirse sin afectar innecesariamente al conjunto. La evolución de Hyprland debe realizarse de manera incremental, documentada y compatible con el resto del sistema, evaluando cada cambio por su contribución funcional y su impacto operativo.

## Terminal

El terminal constituye la interfaz principal para interactuar con el sistema y administrar LinuxPC. A través de esta interfaz se desarrollan la mayor parte de las tareas de operación, diagnóstico, mantenimiento, desarrollo y automatización, por lo que su uso debe priorizar la comprensión, la precisión y el control sobre las acciones realizadas.

La configuración del entorno de terminal debe favorecer la productividad, la legibilidad, la consistencia y la mantenibilidad. Las herramientas que lo integran deben relacionarse de forma coherente, conservar responsabilidades claramente definidas y evitar solapamientos que dificulten la interpretación o el mantenimiento de los flujos de trabajo.

La automatización y los procedimientos desarrollados desde el terminal deben permanecer comprensibles, reproducibles y documentados en proporción a su alcance. La evolución de este entorno debe responder a necesidades reales del proyecto y mantenerse alineada con los principios generales de LinuxPC, incorporando cambios que aporten mejoras operativas verificables.

## Automatización

La automatización debe aplicarse como un mecanismo para eliminar tareas repetitivas, reducir errores y aumentar la consistencia operativa. Su incorporación debe responder a una mejora verificable en la calidad, la reproducibilidad o la mantenibilidad del proyecto, y no a la automatización como objetivo independiente.

Ningún proceso debe automatizarse antes de comprender por completo su funcionamiento y poder ejecutarlo manualmente. Los mecanismos resultantes deben permanecer transparentes, verificables y fáciles de inspeccionar, de modo que sea posible conocer las operaciones que realizan, validar sus resultados, identificar con precisión el origen de un fallo y facilitar su corrección.

La automatización debe simplificar la administración del sistema sin ocultar complejidad innecesaria. Cada mecanismo debe conservar un alcance definido y poder mantenerse, modificarse o eliminarse sin producir efectos desproporcionados sobre el resto del proyecto. Toda automatización relevante debe documentarse junto con su propósito, su alcance y su funcionamiento.

Los procesos automatizados deben evolucionar junto con LinuxPC y revisarse cuando cambien los requisitos, las dependencias o la arquitectura. Su permanencia depende de que continúen aportando valor operativo y puedan sostenerse con un nivel de complejidad adecuado a la función que desempeñan.

## Documentación

La documentación constituye una parte integral de la arquitectura de LinuxPC y preserva el conocimiento técnico necesario para su continuidad. Debe conservar las decisiones, los procedimientos y el contexto que permiten interpretar el estado del proyecto sin depender de la memoria, de conversaciones anteriores ni de las circunstancias temporales en que se realizó el trabajo.

Cada cambio relevante debe documentarse con una profundidad proporcional a su impacto y mantener una relación coherente con el estado previsto del proyecto. La información resultante debe facilitar la comprensión, la reconstrucción, el mantenimiento y la recuperación del sistema, y permitir que las operaciones importantes puedan ejecutarse y evaluarse con el contexto adecuado.

El conocimiento necesario para sostener el proyecto debe permanecer en artefactos permanentes del repositorio. La documentación debe revisarse a medida que evolucione LinuxPC, y todo contenido obsoleto o incorrecto debe actualizarse o retirarse para evitar que se convierta en una fuente de errores o contradicciones.

## Convenciones

Las convenciones establecen criterios comunes para organizar y desarrollar LinuxPC. Su función es aumentar la consistencia, la comprensión y la mantenibilidad del proyecto mediante referencias compartidas que reduzcan la ambigüedad en las decisiones habituales.

Las decisiones repetitivas deben resolverse mediante criterios estables en lugar de evaluarse de forma aislada en cada caso. La aplicación consistente de estas convenciones debe facilitar la navegación por el proyecto, la interpretación de sus elementos y la colaboración entre el propietario y los distintos agentes que participen en su desarrollo.

Las convenciones pueden evolucionar cuando exista una mejora justificada, siempre que los cambios se apliquen de forma coherente en el ámbito afectado y se preserve la continuidad del proyecto. Toda excepción relevante debe responder a una necesidad identificable y quedar documentada con el contexto suficiente para evitar inconsistencias o precedentes ambiguos.

## Roadmap

El roadmap define la dirección estratégica de LinuxPC y proporciona un marco para orientar su evolución a largo plazo. No constituye un calendario de implementación ni un compromiso rígido con una secuencia predeterminada, sino una referencia para relacionar las iniciativas futuras con los objetivos técnicos del proyecto.

Las prioridades pueden modificarse conforme evolucionen el conocimiento disponible, las necesidades operativas o la arquitectura. Las mejoras deben incorporarse de forma incremental y compatible con los principios establecidos, manteniendo un equilibrio entre innovación, estabilidad y mantenibilidad. La adopción de nuevas tecnologías debe responder a una necesidad identificada o a una mejora demostrable, y no a su incorporación indiscriminada.

Las decisiones de largo plazo deben revisarse periódicamente para comprobar que sus supuestos y resultados previstos continúan siendo pertinentes. El roadmap debe adaptarse cuando cambie el contexto técnico, preservando una dirección coherente sin impedir revisiones justificadas ni convertir decisiones anteriores en restricciones permanentes.

## Historial de decisiones importantes

Las decisiones importantes forman parte del conocimiento permanente de LinuxPC. Su registro debe conservar el contexto en el que fueron adoptadas, la motivación que las originó, las alternativas consideradas y las consecuencias previstas, de manera que el resultado pueda interpretarse junto con el razonamiento que lo sustenta.

El historial debe permitir comprender por qué la arquitectura evolucionó de una determinada manera y proporcionar una referencia para futuras modificaciones, revisiones y procesos de recuperación. Conservar el razonamiento de una decisión es tan importante como conservar su resultado, ya que permite evaluar sus supuestos y reconocer las condiciones bajo las cuales mantiene su validez.

Las decisiones registradas pueden revisarse cuando cambien los requisitos o exista una alternativa mejor fundamentada. El registro de esa evolución debe garantizar que el conocimiento arquitectónico no dependa de la memoria, del contexto temporal ni de conversaciones pasadas, manteniendo accesible la información necesaria para confirmar, sustituir o revertir una decisión de forma consciente.
