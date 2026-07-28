# LaTeX local

Flujo local configurado en Arch Linux con TeX Live 2026, `latexmk`, VS Code, LaTeX Workshop y Zathura.

## 1. Componentes instalados

- TeX Live 2026
- `latexmk` 4.87
- VS Code
- extensión `james-yu.latex-workshop`
- Zathura
- SyncTeX

## 2. Compilar un documento

Desde la carpeta del proyecto:

```bash
latexmk -pdf -synctex=1 -interaction=nonstopmode main.tex
```

Genera, entre otros:

```text
main.pdf
main.synctex.gz
```

## 3. Limpiar archivos generados

```bash
latexmk -C
```

## 4. Abrir el PDF

```bash
zathura main.pdf
```

## 5. Compilación continua

Mantiene vigilancia sobre `main.tex` y recompila al guardar:

```bash
latexmk -pdf -pvc -view=none -synctex=1 \
  -interaction=nonstopmode main.tex
```

Detener con:

```text
Ctrl + C
```

## 6. Compilación continua en segundo plano

```bash
latexmk -pdf -pvc -view=none -synctex=1 \
  -interaction=nonstopmode main.tex \
  > /tmp/latexmk-main.log 2>&1 &!
```

Comprobar el proceso:

```bash
pgrep -af latexmk
```

Ver el registro:

```bash
tail -f /tmp/latexmk-main.log
```

Salir del seguimiento del registro:

```text
Ctrl + C
```

Detener la compilación continua:

```bash
pkill -f 'latexmk.*main.tex'
```

## 7. LaTeX Workshop

La extensión compila automáticamente cuando se guarda un archivo `.tex`.

Configuración usada:

```json
"latex-workshop.latex.autoBuild.run": "onSave"
```

### Atajos

| Atajo | Acción |
|---|---|
| `Ctrl + S` | Guardar y compilar automáticamente |
| `Ctrl + Alt + B` | Compilar manualmente |
| `Ctrl + Alt + V` | Abrir el PDF en Zathura |

## 8. Configuración de Zathura en VS Code

Opciones añadidas a `~/.config/Code/User/settings.json`:

```json
"latex-workshop.view.pdf.viewer": "external",

"latex-workshop.view.pdf.external.viewer.command": "zathura",

"latex-workshop.view.pdf.external.viewer.args": [
  "--synctex-editor-command",
  "code -r -g \"%{input}:%{line}\"",
  "%PDF%"
],

"latex-workshop.view.pdf.external.synctex.command": "zathura",

"latex-workshop.view.pdf.external.synctex.args": [
  "--synctex-forward=%LINE%:0:%TEX%",
  "%PDF%"
]
```

## 9. SyncTeX

La compilación usa:

```text
-synctex=1
```

Esto genera:

```text
main.synctex.gz
```

Ese archivo relaciona el código fuente con el PDF.

La integración permite:

- abrir el PDF desde el archivo `.tex`;
- saltar desde el código a la posición correspondiente del PDF;
- volver desde el PDF a la línea correspondiente del código.

## 10. Paquetes de Arch instalados

```text
texlive-basic
texlive-latex
texlive-latexrecommended
texlive-latexextra
texlive-mathscience
texlive-fontsrecommended
texlive-binextra
texlive-langspanish
```

El soporte de Babel para español requiere:

```bash
sudo pacman -S texlive-langspanish
```

## 11. Documento mínimo de prueba

```latex
\documentclass{article}

\usepackage[spanish]{babel}
\usepackage{amsmath,amssymb}

\title{Prueba de LaTeX local}
\author{Oscar}
\date{\today}

\begin{document}

\maketitle

\section{Primera prueba}

Este documento fue compilado localmente en Arch Linux.

\[
\int_0^1 x^2\,dx = \frac{1}{3}
\]

\end{document}
```

## 12. Flujo recomendado

```text
abrir proyecto con VS Code
        ↓
editar main.tex
        ↓
Ctrl + S
        ↓
LaTeX Workshop ejecuta latexmk
        ↓
main.pdf se actualiza
        ↓
Ctrl + Alt + V abre Zathura
```

## 13. Comandos rápidos

```bash
# Compilar una vez
latexmk -pdf -synctex=1 -interaction=nonstopmode main.tex

# Limpiar archivos auxiliares
latexmk -C

# Abrir el PDF
zathura main.pdf

# Compilar continuamente
latexmk -pdf -pvc -view=none -synctex=1 \
  -interaction=nonstopmode main.tex

# Compilar continuamente en segundo plano
latexmk -pdf -pvc -view=none -synctex=1 \
  -interaction=nonstopmode main.tex \
  > /tmp/latexmk-main.log 2>&1 &!

# Ver procesos latexmk
pgrep -af latexmk

# Ver el registro
tail -f /tmp/latexmk-main.log

# Detener latexmk para main.tex
pkill -f 'latexmk.*main.tex'
```
