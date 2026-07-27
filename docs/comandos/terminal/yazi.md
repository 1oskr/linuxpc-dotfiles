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
| `g c` | `/home/oscar/linuxpc-dotfiles/docs/comandos` |
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
| Texto y código | `code --reuse-window` |

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

## 10. Cambiar permisos

Atajo personalizado:

```text
c m
```

Abre el plugin `chmod` para modificar los permisos del archivo o carpeta seleccionada.

### Permisos comunes

| Código | Uso habitual |
|---|---|
| `644` | Archivo normal: el propietario puede leer y escribir; el grupo y los demás solo pueden leer |
| `755` | Script ejecutable o carpeta accesible: el propietario tiene control completo y los demás pueden leer y ejecutar |
| `600` | Archivo privado: solo el propietario puede leer y escribir |
| `700` | Script o carpeta privada: solo el propietario tiene acceso completo |

### Significado de cada dígito

Los permisos se escriben con tres dígitos:

```text
propietario grupo otros
```

Cada dígito se calcula sumando:

| Valor | Permiso |
|---|---|
| `4` | Lectura |
| `2` | Escritura |
| `1` | Ejecución |

Ejemplos:

```text
6 = 4 + 2       lectura y escritura
7 = 4 + 2 + 1   lectura, escritura y ejecución
5 = 4 + 1       lectura y ejecución
```

Interpretación:

```text
644 = propietario: lectura y escritura
      grupo: lectura
      otros: lectura

755 = propietario: lectura, escritura y ejecución
      grupo: lectura y ejecución
      otros: lectura y ejecución

600 = propietario: lectura y escritura
      grupo: sin permisos
      otros: sin permisos

700 = propietario: lectura, escritura y ejecución
      grupo: sin permisos
      otros: sin permisos
```

### Verificar permisos

```bash
stat -c '%A %a %n' archivo
```

Ejemplo:

```text
-rw------- 600 archivo
```

### Recomendaciones

- Usa `644` para documentos normales.
- Usa `755` para scripts ejecutables y carpetas accesibles.
- Usa `600` para archivos privados.
- Usa `700` para scripts o carpetas privadas.
- Evita `777`, salvo que entiendas claramente sus implicaciones.

## 11. Pestañas

| Tecla | Acción |
|---|---|
| `t t` | Crear una pestaña nueva en la ruta actual |
| `1`–`9` | Cambiar a una pestaña concreta |
| `[` | Ir a la pestaña anterior |
| `]` | Ir a la pestaña siguiente |
| `{` | Mover la pestaña actual hacia la izquierda |
| `}` | Mover la pestaña actual hacia la derecha |
| `Ctrl+c` | Cerrar la pestaña actual |

### Ejemplo de uso

```text
g d    Ir a Dotfiles
t t    Crear otra pestaña
g m    Ir al HDD
1      Volver a la primera pestaña
2      Ir a la segunda pestaña
```

## 12. Flujo diario recomendado

```text
g h       Home
g d       Dotfiles
g w       Wallpapers
g m       HDD
g c       Manual de comandos
/         Buscar en la carpeta
f         Filtrar
Space     Seleccionar
y / x     Copiar / cortar
p         Pegar
r         Renombrar
d         Papelera
D         Eliminar permanentemente
c m       Cambiar permisos
.         Mostrar ocultos
Tab       Información
O         Abrir con…
q         Salir
```

## 13. Apertura de archivos Markdown

Los archivos `.md`, `.txt`, `.lua`, `.toml`, `.conf`, `.json`, `.jsonc`, `.yaml`, `.yml`, `.tex`, `.bib`, `.py`, `.sh` y `.zsh` están configurados para abrirse en VS Code mediante:

```bash
code --reuse-window
```

Esto evita el error anterior causado por el intento de usar `vi`, que no estaba disponible en el sistema.

## 14. Plugins instalados

| Plugin | Función |
|---|---|
| `git.yazi` | Mostrar estados de Git dentro de Yazi |
| `chmod.yazi` | Cambiar permisos mediante `c m` |

## Fuentes oficiales

- https://yazi-rs.github.io/docs/quick-start/
- https://yazi-rs.github.io/docs/configuration/keymap/
- https://yazi-rs.github.io/docs/configuration/yazi/
- https://yazi-rs.github.io/docs/term/
