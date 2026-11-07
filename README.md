# nndsk-vimstack

Kitty y LazyVim con tema Noctalia, diff de Git y otra pestaña para Codex, Claude Code o una terminal.

## Instalación

En CachyOS o Arch:

```bash
sudo pacman -S --needed git kitty neovim ripgrep fd lazygit tree-sitter-cli ttf-fantasque-nerd base-devel nodejs npm
git clone https://github.com/Nandem1/nndsk-vimstack.git
cd nndsk-vimstack
./install.sh
```

Usa `./install.sh --dry-run` para ver los destinos antes de instalar. En otras distribuciones, instala las mismas dependencias con tu gestor de paquetes.

Agrega `~/.local/bin` a tu PATH. En el primer inicio, Neovim necesita Internet para descargar plugins. Ejecuta `:Lazy restore` para usar las versiones guardadas y reinicia el editor.

Instala y autentica Codex o Claude Code por separado. Si el asistente no está instalado, el lanzador abre una terminal.

## Uso

```bash
ide .          # LazyVim + Codex
ide . claude   # LazyVim + Claude Code
ide . shell    # LazyVim + terminal
```

Guarda tus archivos antes de pedir cambios al asistente. LazyVim recarga los cambios externos si no tienes ediciones pendientes.

## Atajos

### Kitty

| Teclas | Acción |
|---|---|
| Ctrl + Shift + T | Abrir terminal en otra pestaña |
| Ctrl + Shift + ← / → | Cambiar de pestaña |
| Ctrl + Shift + 1 / 2 / 3 | Ir a esa pestaña |
| Ctrl + Shift + Q | Cerrar pestaña |

### LazyVim

Pulsa Esc primero. Las flechas indican teclas en secuencia; las mayúsculas requieren Shift.

| Teclas | Acción |
|---|---|
| Espacio y esperar | Ver atajos |
| Espacio → e | Abrir o cerrar explorador |
| Ctrl + h / j / k / l | Ir al panel izquierdo / inferior / superior / derecho |
| Shift + H / L | Cambiar de archivo |
| Espacio → b → d | Cerrar archivo |
| Espacio → Espacio | Buscar archivo |
| Espacio → / | Buscar texto |
| Espacio → f → t | Abrir terminal integrada |
| Espacio → g → g | Abrir LazyGit |
| Espacio → g → D / Q / H | Abrir diff / cerrar diff / ver historial |
| i / Esc | Escribir / navegar |
| :w / :q y Enter | Guardar / salir |

El diff requiere Git y muestra los cambios guardados. Para salir del modo de escritura de la terminal integrada, pulsa Ctrl + \ y después Ctrl + n.

## Configuración y respaldos

Edita `config/nvim/`, `config/kitty/` o `bin/ide` y vuelve a ejecutar el instalador. Los cambios hechos en la configuración instalada deben copiarse al repositorio antes de subirlos.

El instalador respalda los archivos que reemplaza en `~/.local/share/terminal-ide/backups/`. Para restaurarlos, cierra el editor y devuelve los archivos del respaldo a sus rutas originales. Respeta `XDG_CONFIG_HOME` y `XDG_DATA_HOME` si están definidos.

La configuración de Neovim deriva de LazyVim Starter. Su [licencia](config/nvim/LICENSE) está incluida.
