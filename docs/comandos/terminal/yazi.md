# Yazi 26.5.6 — guía de comandos

Guía verificada con la documentación oficial de Yazi 26.5.6 y adaptada a la configuración actual de `oscar`.

## 1. Navegación

| Tecla | Acción |
|---|---|
| `j` / `↓` | Bajar |
| `k` / `↑` | Subir |
| `h` / `←` | Ir a la carpeta padre |
| `l` / `→` | Entrar en la carpeta seleccionada |
| `Enter` | Abrir el archivo o entrar en la carpeta |
| `g g` | Ir al inicio de la lista |
| `G` | Ir al final de la lista |
| `H` | Retroceder en el historial |
| `L` | Avanzar en el historial |
| `K` | Subir 5 unidades en la vista previa |
| `J` | Bajar 5 unidades en la vista previa |
| `z` | Ir a una ruta usando `fzf` |
| `Z` | Ir a una ruta usando `zoxide` |
| `g Space` | Escribir una ruta de forma interactiva |

## 2. Saltos personalizados actuales

| Teclas | Ruta |
|---|---|
| `g h` | `/home/oscar` |
| `g d` | `/home/oscar/linuxpc-dotfiles` |
| `g w` | `/home/oscar/Pictures/Wallpapers` |
| `g m` | `/mnt/hdd` |
| `g p` | `~/Projects` — actualmente no existe |

## 3. Abrir archivos

| Tecla | Acción |
|---|---|
| `Enter` | Abrir con la aplicación predeterminada |
| `o` | Abrir selección |
| `O` | Elegir interactivamente con qué aplicación abrir |
| `Shift+Enter` | Apertura interactiva, si la terminal lo admite |

Aplicaciones configuradas:

| Tipo | Aplicación |
|---|---|
| Imágenes | `imv` |
| PDF | `zathura` |
| Videos | `vlc` |

## 4. Selección

| Tecla | Acción |
|---|---|
| `Space` | Seleccionar o deseleccionar el elemento actual |
| `v` | Iniciar modo visual para seleccionar un rango |
| `V` | Iniciar modo visual para deseleccionar un rango |
| `Ctrl+a` | Seleccionar todo |
| `Ctrl+r` | Invertir selección |
| `Esc` | Cancelar selección o modo actual |

## 5. Archivos y carpetas

| Tecla | Acción |
|---|---|
| `a` | Crear archivo; termina el nombre en `/` para crear una carpeta |
| `r` | Renombrar |
| `y` | Copiar |
| `x` | Cortar |
| `p` | Pegar |
| `P` | Pegar sobrescribiendo si ya existe |
| `Y` / `X` | Cancelar el estado de copia o corte |
| `d` | Enviar a la papelera |
| `D` | Eliminar permanentemente |
| `.` | Mostrar u ocultar archivos ocultos |

## 6. Copiar nombres y rutas

Las combinaciones se presionan una tecla después de la otra.

| Teclas | Acción |
|---|---|
| `c c` | Copiar ruta completa |
| `c d` | Copiar ruta de la carpeta contenedora |
| `c f` | Copiar nombre con extensión |
| `c n` | Copiar nombre sin extensión |

## 7. Buscar, encontrar y filtrar

| Tecla | Acción |
|---|---|
| `/` | Encontrar hacia adelante en la carpeta actual |
| `?` | Encontrar hacia atrás |
| `n` | Siguiente coincidencia |
| `N` | Coincidencia anterior |
| `f` | Filtrar la lista actual |
| `s` | Buscar archivos por nombre usando `fd` |

## 8. Información y ayuda

| Tecla | Acción |
|---|---|
| `Tab` | Mostrar información del archivo seleccionado |
| `~` | Abrir la ayuda de teclas |
| `q` | Salir de Yazi |

## 9. Comandos de shell

| Tecla | Acción |
|---|---|
| `;` | Ejecutar un comando de shell sin bloquear Yazi |
| `:` | Ejecutar un comando y esperar a que termine |

## 10. Pestañas

Yazi incluye pestañas, pero conviene consultar `~` dentro de Yazi para ver las teclas exactas cargadas por esta versión y cualquier cambio personalizado.

## 11. Flujo diario recomendado

```text
g h       Home
g d       Dotfiles
g w       Wallpapers
g m       HDD
/         Buscar en la carpeta
f         Filtrar
Space     Seleccionar
y / x     Copiar / cortar
p         Pegar
r         Renombrar
d         Papelera
D         Eliminar permanentemente
.         Mostrar ocultos
Tab       Información
O         Abrir con…
q         Salir
```

## 12. Problema actual con archivos Markdown

Al abrir un `.md`, Yazi ejecutó:

```text
${EDITOR:-vi} archivo.md
```

El proceso terminó con código `127`, que normalmente significa que el comando no existe. En este sistema, Yazi intentó usar `vi`, pero `vi` no está instalado o no está disponible en `PATH`.

La solución recomendada para este entorno es configurar los archivos de texto y Markdown para abrirse en VS Code mediante un `opener` específico, o definir:

```bash
export EDITOR=code
export VISUAL=code
```

Para usar VS Code desde Yazi sin bloquearlo, es preferible un opener con `code --reuse-window`.

## Fuentes oficiales

- https://yazi-rs.github.io/docs/quick-start/
- https://yazi-rs.github.io/docs/configuration/keymap/
- https://yazi-rs.github.io/docs/configuration/yazi/
- https://yazi-rs.github.io/docs/term/
