# Límites de configuración

## Propósito

Definir qué tipo de contenido pertenece al repositorio, al sistema o a una
ubicación externa, sin reorganizar todavía los archivos ni la configuración
activa. La clasificación distingue:

- configuración común y reproducible;
- configuración específica de LinuxPC;
- configuración personal no sensible;
- secretos;
- estado generado o efímero;
- datos que no deben pertenecer al repositorio;
- documentación;
- borradores y referencias.

El propietario de las familias actuales es Oscar. El alcance indica dónde puede
aplicarse cada contenido y no implica que una configuración presente en Arch
Linux sea portable a los demás sistemas.

## Relación con la matriz de fuente de verdad

La [matriz de fuente de verdad](15-matriz-fuente-de-verdad.md) define qué fuente
tiene autoridad sobre el estado previsto, el estado efectivo, los respaldos,
los secretos y el estado efímero. Este documento define qué tipo de contenido
pertenece a cada ubicación y cómo debe clasificarse antes de versionarlo.

Ambos documentos son complementarios:

- la matriz responde dónde se verifica el estado autorizado;
- este documento responde qué puede conservarse en cada fuente;
- ninguno sustituye los inventarios ni debe duplicar el contenido del otro.

## Reglas por categoría

### Configuración común y reproducible

- **Propietario:** Oscar.
- **Alcance:** comportamiento declarativo reutilizable que no depende de una
  máquina, identidad o estado de ejecución concretos.
- **Plataformas:** solo las declaradas por cada componente; la portabilidad
  entre Arch Linux, Bazzite y macOS debe comprobarse.
- **Puede versionarse:** opciones estables, módulos, funciones, scripts y
  plantillas comprensibles y reproducibles.
- **Permanece en el sistema:** la copia activa y el estado efectivo cargado por
  cada aplicación.
- **Fuera de Git:** datos privados, archivos generados y dependencias
  instaladas.
- **Puede generarse:** archivos activos derivados de una plantilla cuando el
  proceso y sus entradas estén definidos.
- **Separación por máquina:** cualquier valor que dependa de hardware, rutas
  físicas, hostname o servicios exclusivos de un equipo.
- **Solo se documenta:** dependencias, procedimiento de aplicación y
  verificaciones que no formen parte del archivo declarativo.

### Configuración específica de LinuxPC

- **Propietario:** Oscar.
- **Alcance:** estado previsto ligado al equipo LinuxPC, su hardware o su rol.
- **Plataformas:** Arch Linux por defecto; Bazzite únicamente cuando se declare
  y verifique de forma explícita. No se presume aplicabilidad a macOS.
- **Puede versionarse:** perfiles identificados como `linuxpc`, unidades,
  overrides y scripts mantenibles que no contengan secretos.
- **Permanece en el sistema:** habilitación efectiva, dispositivos presentes,
  rutas instaladas y estado aplicado.
- **Fuera de Git:** identificadores sensibles, credenciales y datos producidos
  durante el uso.
- **Puede generarse:** enlaces, archivos activos o fragmentos derivados de un
  perfil versionado.
- **Separación por máquina:** monitores, GPU, rutas físicas, dispositivos,
  hostname y cualquier ajuste que perdería sentido en otro equipo.
- **Solo se documenta:** estado observado que todavía no tenga una
  representación declarativa segura.

### Configuración personal no sensible

- **Propietario:** Oscar.
- **Alcance:** preferencias deliberadas de interacción, apariencia y flujo de
  trabajo que no revelan material sensible.
- **Plataformas:** las indicadas por cada preferencia.
- **Puede versionarse:** temas, colores, atajos, alias, funciones y preferencias
  estables.
- **Permanece en el sistema:** la selección efectiva cuando una aplicación la
  mantiene fuera de sus archivos declarativos.
- **Fuera de Git:** historial, actividad reciente y valores personales que no
  sean necesarios para reconstruir el entorno.
- **Puede generarse:** variantes activas derivadas de preferencias versionadas.
- **Separación por máquina:** preferencias combinadas con hardware, hostname o
  rutas locales.
- **Solo se documenta:** decisiones personales relevantes que no necesiten un
  archivo de configuración.

### Secretos

- **Propietario:** Oscar.
- **Alcance:** claves privadas, tokens, contraseñas, cookies, sesiones y
  credenciales.
- **Plataformas:** todas.
- **Puede versionarse:** nada que permita recuperar o utilizar el valor.
- **Permanece en el sistema:** solo cuando el mecanismo de la aplicación lo
  requiera y con permisos adecuados.
- **Fuera de Git:** todos los valores y las copias que los contengan.
- **Puede generarse:** credenciales temporales únicamente en el almacén o
  entorno autorizado, nunca dentro del repositorio.
- **Separación por máquina:** cuando una credencial esté vinculada a un
  dispositivo o sistema concreto.
- **Solo se documenta:** existencia, propósito, responsable, rotación y método
  de recuperación sin revelar el valor.

### Estado generado o efímero

- **Propietario:** la aplicación o proceso que lo genera; Oscar es responsable
  de su política de conservación.
- **Alcance:** cachés, logs, locks, sesiones, respaldos automáticos, selecciones
  temporales, archivos de estado y enlaces creados por herramientas.
- **Plataformas:** todas.
- **Puede versionarse:** no, salvo una muestra ficticia necesaria para probar
  un formato y claramente identificada como tal.
- **Permanece en el sistema:** en las ubicaciones de caché, estado o runtime
  previstas por la aplicación.
- **Fuera de Git:** el estado real y sus valores históricos.
- **Puede generarse:** siempre que sea regenerable y no se convierta en una
  dependencia implícita.
- **Separación por máquina:** cuando refleje una ejecución o instalación
  concreta.
- **Solo se documenta:** ubicación, propósito, limpieza y método de
  regeneración cuando sean operativamente relevantes.

### Datos que no deben pertenecer al repositorio

- **Propietario:** propietario declarado para cada conjunto de datos.
- **Alcance:** documentos personales, wallpapers, multimedia, respaldos,
  archivos restaurados, paquetes, binarios y datos de aplicaciones.
- **Plataformas:** todas.
- **Puede versionarse:** únicamente metadatos o inventarios no sensibles cuando
  sean necesarios para reconstrucción o recuperación.
- **Permanece en el sistema:** el dato activo requerido por el usuario o la
  aplicación.
- **Fuera de Git:** el contenido completo y sus copias.
- **Puede generarse:** descargas, compilaciones y artefactos regenerables.
- **Separación por máquina:** cuando la ubicación o el consumidor dependan del
  sistema.
- **Solo se documenta:** ubicación, propietario, criticidad, recuperación y
  dependencias.

### Documentación

- **Propietario:** Oscar.
- **Alcance:** arquitectura, decisiones, procedimientos y conocimiento
  consolidado de LinuxPC.
- **Plataformas:** todas las descritas por cada documento.
- **Puede versionarse:** información validada, mantenible y necesaria para
  comprender, verificar o recuperar el proyecto.
- **Permanece en el sistema:** evidencias temporales utilizadas para validar lo
  documentado.
- **Fuera de Git:** valores secretos, datos personales innecesarios y salidas
  extensas que puedan regenerarse.
- **Puede generarse:** índices o reportes solo si su fuente y actualización son
  reproducibles.
- **Separación por máquina:** secciones o documentos cuyo alcance sea un equipo
  concreto.
- **Solo se documenta:** comportamiento, decisiones y verificaciones que no
  deban representarse como configuración.

### Borradores y referencias

- **Propietario:** Oscar.
- **Alcance:** material de trabajo todavía no consolidado y referencias
  auxiliares con propósito conocido.
- **Plataformas:** las declaradas por cada elemento.
- **Puede versionarse:** material no sensible con procedencia, propósito y
  estado explícitos.
- **Permanece en el sistema:** material temporal sin valor de continuidad.
- **Fuera de Git:** copias arbitrarias, contenido sin procedencia y datos con
  restricciones o sensibilidad no evaluadas.
- **Puede generarse:** borradores desechables, que no deben presentarse como
  conocimiento autorizado.
- **Separación por máquina:** cuando la referencia describa exclusivamente una
  instalación concreta.
- **Solo se documenta:** procedencia, uso previsto y condición para consolidar
  o retirar el elemento.

## Familias actuales

| Familia | Propietario | Alcance | Plataforma | Categoría principal | Excepciones o mezcla actual | Proyecto posterior |
|---|---|---|---|---|---|---|
| `.config/hypr/` | Oscar | Escritorio declarativo y perfil físico | Arch Linux y Hyprland | Configuración común y reproducible | El perfil `machines/linuxpc.lua` está vacío; monitores, autostart y `hyprpaper.conf` mezclan estado común, físico y generado | P1-09 y P1-10 |
| `.config/waybar/` | Oscar | Barra del escritorio | Arch Linux y Hyprland | Configuración específica de LinuxPC | Los archivos por salida y la integración NVIDIA mezclan presentación común con hardware | P1-10 y P2-03 |
| `.config/kitty/` | Oscar | Terminal gráfico | Arch Linux; portabilidad por verificar | Configuración personal no sensible | La relación entre copia activa y repositorio debe verificarse de forma repetible | P1-13 y P2-03 |
| `.config/rofi/` | Oscar | Lanzador, menús y temas | Arch Linux y Wayland | Configuración personal no sensible | La copia activa diverge del repositorio y contiene recursos y respaldos locales | P1-13 y P2-03 |
| `.config/matuwall/` | Oscar | Selector y preferencias de wallpapers | Arch Linux y LinuxPC | Configuración específica de LinuxPC | El directorio activo enlaza al repositorio y la aplicación genera un respaldo dentro de él | P1-10 y P2-01 |
| `.config/systemd/` | Oscar | Overrides declarativos de servicios de usuario | Arch Linux | Configuración específica de LinuxPC | La habilitación y los enlaces efectivos pertenecen al sistema, no al repositorio | P1-04 y P1-09 |
| `.local/bin/` | Oscar | Utilidades mantenibles del usuario | Principalmente Arch Linux y Wayland | Configuración personal no sensible | Varios scripts codifican monitores, GPU o integración exclusiva de LinuxPC; `powermenu` diverge de su copia activa | [P1-03](17-inventario-arch.md), completado; P1-10, P1-13 y P2-03 |
| `.zshrc` | Oscar | Shell interactivo | Arch Linux; partes potencialmente portables | Configuración personal no sensible | Mezcla inicialización portable con aplicaciones y mecanismos propios de Arch, Wayland y Kitty | P1-13 |
| `.config/starship.toml` | Oscar | Prompt del shell | Sistemas con Starship | Configuración personal no sensible | Mezcla presentación personal con identidad de máquina | P1-10 y P1-13 |
| `.config/btop/` | Oscar | Monitorización y temas | Sistemas con Btop | Configuración personal no sensible | La configuración activa genera respaldos locales y existe una referencia sin política completa | P1-13 y P2-03 |
| `.config/fastfetch/` | Oscar | Presentación de información del sistema | Sistemas con Fastfetch | Configuración personal no sensible | La información mostrada puede depender del sistema efectivo | [P1-03](17-inventario-arch.md), completado; P1-13 |
| `.config/satty/` | Oscar | Anotación de capturas | Arch Linux y Wayland | Configuración común y reproducible | Sus dependencias gráficas están registradas en el inventario de Arch | [P1-03](17-inventario-arch.md), completado |
| `.config/snappy-switcher/` | Oscar | Selector de ventanas | Arch Linux y Hyprland | Configuración personal no sensible | La copia activa diverge del repositorio y su override depende de systemd de usuario | P1-09 y P2-03 |
| `.config/gtk-3.0/` y `.config/gtk-4.0/` | Oscar | Preferencias y tema GTK | Arch Linux | Configuración personal no sensible | Los enlaces GTK 4 son absolutos y dependen de un tema instalado en el sistema | [P1-03](17-inventario-arch.md), completado; P1-04 y P2-01 |
| `docs/` | Oscar | Conocimiento autorizado del proyecto | Todas | Documentación | Puede contener identificadores personales o del sistema solo cuando sean necesarios y aceptados conscientemente | P1-08 y P1-18 |
| `drafts/` | Oscar | Trabajo no consolidado | Según cada borrador | Borradores y referencias | Falta definir el ciclo de consolidación o retiro de su contenido | P1-17 |
| `.gitignore` | Oscar | Exclusión preventiva del repositorio | Todas | Configuración común y reproducible | No sustituye la revisión previa ni autoriza a guardar secretos en archivos ignorados | P1-19 y P2-03 |

La categoría principal no elimina las excepciones. Cuando un archivo combina
categorías, debe conservarse sin reorganizar hasta que el proyecto posterior
indicado determine una separación verificable.

## Secretos y datos sensibles

Las claves privadas, tokens, contraseñas, cookies y sesiones están prohibidos
en Git, incluidos el historial, las ramas no publicadas y los archivos
ignorados. El repositorio solo puede documentar su existencia, propósito,
propietario y procedimiento de recuperación.

Los valores nunca deben copiarse a documentación, ejemplos, logs, diagnósticos
o conversaciones destinadas a consolidarse en el repositorio. Los
identificadores personales, nombres de máquina y datos de red local solo se
publican conscientemente cuando son necesarios para comprender o verificar el
proyecto. Su presencia no debe confundirse con autorización para publicar
credenciales.

## Configuración específica por máquina

Debe utilizarse un perfil como `machines/linuxpc.lua` cuando una configuración
dependa del equipo físico o pierda su significado en otra instalación. Esto
incluye hardware, monitores, GPU, rutas físicas, dispositivos y nombres o
servicios ligados al equipo.

Una configuración específica puede versionarse si está identificada
explícitamente como tal, no contiene secretos y representa estado previsto
mantenible. Su presencia en el repositorio no implica portabilidad hacia
Bazzite o macOS. La aplicabilidad a otro sistema debe declararse y verificarse
antes de reutilizarla.

## Estado generado

Las cachés, logs, locks, respaldos automáticos, selecciones temporales de
wallpaper, sesiones, historiales y enlaces creados por herramientas no son
configuración canónica y deben excluirse de Git.

Un archivo generado dentro de un directorio enlazado al repositorio sigue
siendo estado generado. Su ubicación no lo convierte en estado previsto ni
autoriza su versionado. Cuando una aplicación necesite un archivo activo
derivado de datos mantenibles, debe conservarse la entrada declarativa y
documentarse o generarse el resultado.

En systemd, una unidad u override mantenible puede estar versionado. La
habilitación efectiva, los enlaces creados por `systemctl` y el estado activo
pertenecen al sistema.

## Divergencias conocidas

Estas divergencias quedan registradas sin determinar qué copia debe prevalecer:

- `machines/linuxpc.lua` todavía está vacío;
- la topología física permanece dentro de configuración general;
- `hyprpaper.conf` mezcla rutas personales, monitores y selección activa;
- Starship mezcla presentación personal y nombre de máquina;
- `.zshrc` mezcla configuración portable y dependencias de Arch y Wayland;
- Waybar mezcla configuración común y hardware;
- los enlaces GTK son absolutos;
- los métodos de activación mediante enlaces y copias son inconsistentes;
- las copias activas y el repositorio difieren en Rofi, Waybar, Snappy Switcher
  y `powermenu`;
- existen respaldos generados dentro de directorios activos;
- falta una política completa para `drafts/` y las referencias.

## Proyectos derivados

| Proyecto | Responsabilidad derivada |
|---|---|
| [P1-03 — Inventario declarativo de Arch](17-inventario-arch.md), completado | Inventariar paquetes, aplicaciones y dependencias requeridas por la configuración. |
| [P1-04 — Inventario de configuración del sistema](18-inventario-configuracion-sistema.md), completado | Registrar configuración efectiva, habilitación y estado relevante fuera del repositorio. |
| P1-08 — Seguridad y acceso desde macOS | Revisar acceso remoto, exposición e identificadores relacionados. |
| P1-09 — Ciclo de vida de la sesión Hyprland | Delimitar sesión, autostart y servicios de usuario. |
| P1-10 — Perfil físico de LinuxPC | Separar hardware, monitores, GPU y rutas físicas de la configuración común. |
| P1-13 — Flujo de terminal | Consolidar shell, prompt, terminal y utilidades personales. |
| P1-22 — Baseline de recuperación de Bazzite | Definir qué límites y configuraciones son aplicables a Bazzite. |
| P2-01 — Automatización de reconstrucción | Implementar despliegue, generación y creación controlada de enlaces. |
| P2-03 — Verificación de estado y divergencias | Detectar de forma repetible diferencias entre el repositorio y las copias activas. |

## Resultado de P1-02

Cada familia actual tiene propietario, alcance, plataforma y categoría
principal definidos. Las reglas de inclusión y exclusión delimitan el
repositorio, el sistema, los secretos, el estado generado y los datos externos.
Las mezclas y divergencias conocidas se conservan sin cambios técnicos y quedan
asignadas a proyectos posteriores.
