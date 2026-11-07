#!/usr/bin/env bash
set -euo pipefail
source_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
config_dir="${XDG_CONFIG_HOME:-$HOME/.config}"
data_dir="${XDG_DATA_HOME:-$HOME/.local/share}"
dry_run=false
case "${1:-}" in
  --dry-run) dry_run=true ;;
  --help) echo 'Uso: ./install.sh [--dry-run] — instala configuraciones y respalda las anteriores'; exit 0 ;;
  '') ;;
  *) echo 'Argumento desconocido. Usa --help.' >&2; exit 1 ;;
esac
for dependency in git kitty nvim rg fd lazygit tree-sitter; do
  if ! command -v "$dependency" >/dev/null; then
    echo "Aviso: falta $dependency en PATH. Consulta README.md."
  fi
done
if "$dry_run"; then
  printf 'Instalaría Neovim en %s/nvim, Kitty en %s/kitty e ide en %s/.local/bin/ide\n' "$config_dir" "$config_dir" "$HOME"
  echo 'Respaldaría cualquier archivo o carpeta de destino existente. No se hicieron cambios.'
  exit 0
fi
mkdir -p "$data_dir/terminal-ide/backups" "$config_dir" "$HOME/.local/bin"
backup_dir="$(mktemp -d "$data_dir/terminal-ide/backups/$(date +%Y%m%d-%H%M%S)-XXXXXX")"
backup() {
  if [[ -e "$1" || -L "$1" ]]; then
    mkdir -p "$backup_dir/$(dirname -- "$2")"
    mv -- "$1" "$backup_dir/$2"
  fi
}
backup "$config_dir/nvim" nvim
cp -a "$source_dir/config/nvim" "$config_dir/nvim"
# Back up only the Kitty files managed by this installer.
while IFS= read -r -d '' file; do
  relative="${file#"$source_dir/config/kitty/"}"
  backup "$config_dir/kitty/$relative" "kitty/$relative"
  mkdir -p "$(dirname -- "$config_dir/kitty/$relative")"
  cp -- "$file" "$config_dir/kitty/$relative"
done < <(find "$source_dir/config/kitty" -type f -print0)
backup "$HOME/.local/bin/ide" bin/ide
install -m 755 "$source_dir/bin/ide" "$HOME/.local/bin/ide"
printf 'Instalado. Respaldo: %s\n' "$backup_dir"
echo 'Agrega ~/.local/bin a PATH si hace falta. Ejecuta: ide .'
echo 'En el primer inicio, Neovim descargará los plugins. Usa :Lazy restore para aplicar lazy-lock.json.'
