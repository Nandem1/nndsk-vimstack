# nndsk-vimstack — Mi IDE de terminal

Kitty + LazyVim con una pestaña independiente para Codex, Claude Code o el shell.
Incluye el tema oscuro Noctalia, diff de Git y recarga de archivos modificados externamente
cuando el buffer no tiene cambios pendientes. Configuración guardada el 7 de noviembre de 2026.

## Instalación en Linux

Necesitas Bash, Git, Kitty, Neovim compatible con LazyVim, ripgrep, fd, LazyGit,
Tree-sitter CLI y una fuente FantasqueSansM Nerd Font Mono. Para instalar plugins y
herramientas de lenguajes necesitas conexión a Internet; algunos requieren compilador C y Node.js/npm.
El instalador copia configuraciones; no instala programas del sistema ni requiere sudo.

En CachyOS/Arch, instala las dependencias con el gestor de paquetes:

```bash
sudo pacman -S --needed git kitty neovim ripgrep fd lazygit tree-sitter-cli ttf-fantasque-nerd base-devel nodejs npm
```

Clona este repositorio y ejecuta:

```bash
git clone https://github.com/Nandem1/nndsk-vimstack.git
cd nndsk-vimstack
./install.sh --dry-run
./install.sh
```

Si `ide` no está en PATH, agrega `export PATH="$HOME/.local/bin:$PATH"` al archivo
`~/.bashrc` o `~/.zshrc` según tu shell. Puedes usar directamente `~/.local/bin/ide`.

Abre Neovim con conexión a Internet para descargar los plugins. Ejecuta `:Lazy restore`
para aplicar las revisiones guardadas en `lazy-lock.json`, reinicia Neovim y revisa `:checkhealth`.
Los binarios del sistema y los servidores de lenguaje no están fijados por ese lockfile.

Codex y Claude Code son opcionales: instálalos y autentícate por separado según sus
instrucciones oficiales. El repositorio no incluye sesiones, claves ni credenciales.
Si el asistente seleccionado no está instalado, se abre un shell libre.

## Uso

```bash
ide ~/Projects/mi-proyecto          # Editor + Codex
ide ~/Projects/mi-proyecto claude   # Editor + Claude Code
ide ~/Projects/mi-proyecto shell    # Editor + terminal libre
```

Dentro de Kitty puedes abrir más pestañas y ejecutar `claude`, `codex` u otro comando.
Guarda el archivo antes de pedir a un asistente que lo modifique. LazyVim comprueba cambios
externos al recuperar el foco o entrar al buffer; no reemplaza silenciosamente tus ediciones pendientes.

## Atajos

### Kitty: pestañas de terminal

| Teclas | Acción |
|---|---|
| Ctrl + Shift + T | Nueva terminal en el directorio actual |
| Ctrl + Shift + ← / → | Pestaña anterior / siguiente |
| Ctrl + Shift + 1 / 2 / 3 | Ir a esa pestaña |
| Ctrl + Shift + Q | Cerrar pestaña |

### LazyVim: primero Esc

Las teclas separadas por una flecha se pulsan en secuencia. Mayúsculas requieren Shift.

| Teclas | Acción |
|---|---|
| Espacio y esperar | Ver menú de atajos |
| Espacio → e | Abrir/cerrar explorador |
| Ctrl + h / j / k / l | Panel izquierdo / inferior / superior / derecho |
| Shift + H / L | Archivo anterior / siguiente |
| Espacio → b → d | Cerrar buffer |
| Espacio → Espacio | Buscar archivo |
| Espacio → / | Buscar texto |
| Espacio → f → t | Terminal integrada del proyecto |
| Espacio → g → g | LazyGit |
| Espacio → g → D | Diff del proyecto |
| Espacio → g → Q | Cerrar diff |
| Espacio → g → H | Historial del archivo |
| i / Esc | Escribir / navegar |
| :w / :q y Enter | Guardar / salir |
| gt / gT | Siguiente/anterior pestaña de Neovim creada con :tabnew |

El diff y el historial requieren un repositorio Git. Guarda con `:w` para incluir tus
ediciones en el diff del disco. En una terminal integrada, Ctrl + \\ y después Ctrl + n
vuelve al modo normal; `i` permite escribir otra vez.

## Archivos y respaldos

- `config/nvim/`: configuración de LazyVim y versiones de plugins.
- `config/kitty/`: tema, atajos y sesiones portables.
- `bin/ide`: lanzador que usa los ejecutables de PATH.
- `install.sh`: instalador con respaldos; respeta XDG_CONFIG_HOME y XDG_DATA_HOME.

Cada instalación mueve la configuración previa de Neovim, los archivos administrados de
Kitty y el lanzador existente a `~/.local/share/terminal-ide/backups/FECHA-SUFIJO/`
(o la ruta correspondiente a XDG_DATA_HOME). Conserva los demás archivos de Kitty.
Para volver atrás, cierra el editor, mueve la configuración nueva a otra carpeta y restaura
`nvim`, los archivos de `kitty/` y `bin/ide` del respaldo a sus destinos originales.
Si no existía una configuración anterior, no habrá una copia de ella en el respaldo.

Editar los archivos instalados no actualiza este repositorio automáticamente: copia tus
cambios a `config/` o `bin/`, revisa `git diff`, crea un commit y súbelo a GitHub.
El tema queda guardado como copia estática; no requiere instalar el escritorio Noctalia.

La configuración inicial de Neovim deriva de LazyVim Starter; su licencia se conserva en
`config/nvim/LICENSE`.
