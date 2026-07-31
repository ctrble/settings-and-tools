#!/usr/bin/env bash
#
# install.sh — symlink configs from this repo into place.
#
# Idempotent and non-destructive: anything already at a target path is
# moved to <path>.backup-<timestamp> before the symlink is created.
# Already-correct symlinks are left alone.
#
# Usage:
#   ./install.sh            # do it
#   ./install.sh --dry-run  # show what would happen
#
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STAMP="$(date +%Y%m%d-%H%M%S)"
DRY_RUN=false
[[ "${1:-}" == "--dry-run" ]] && DRY_RUN=true

link() {
  local src="$REPO/$1" dest="$2"

  if [[ ! -e "$src" ]]; then
    echo "  ✗ missing in repo: $1"
    return
  fi

  # Already pointing where we want it.
  if [[ -L "$dest" && "$(readlink "$dest")" == "$src" ]]; then
    echo "  = $dest"
    return
  fi

  if $DRY_RUN; then
    [[ -e "$dest" || -L "$dest" ]] && echo "  ! would back up $dest"
    echo "  → would link $dest"
    return
  fi

  mkdir -p "$(dirname "$dest")"
  if [[ -e "$dest" || -L "$dest" ]]; then
    mv "$dest" "$dest.backup-$STAMP"
    echo "  ! backed up → $(basename "$dest").backup-$STAMP"
  fi
  ln -s "$src" "$dest"
  echo "  → $dest"
}

echo "Linking configs from $REPO"
$DRY_RUN && echo "(dry run — nothing will change)"
echo

link "shell/.zshrc"                "$HOME/.zshrc"
link "shell/starship.toml"         "$HOME/.config/starship.toml"
link "terminal/ghostty/config"     "$HOME/.config/ghostty/config"
link "terminal/zed/settings.json"  "$HOME/.config/zed/settings.json"

echo
echo "Done. Now: exec zsh"
echo
echo "Reminder: Zed settings.json was REPLACED, not merged."
echo "If you had settings there, reconcile them from the .backup file."
