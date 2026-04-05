#!/usr/bin/env sh
set -eu

REPO_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
BACKUP_SUFFIX=".bak.$(date +%Y%m%d%H%M%S)"

mkdir -p "$HOME/.config"

if [ -d "$HOME/.config" ] && [ "$(ls -A "$HOME/.config" 2>/dev/null)" ]; then
  cp -r "$HOME/.config" "$HOME/.config$BACKUP_SUFFIX"
fi

if [ -f "$HOME/.bashrc" ]; then
  cp "$HOME/.bashrc" "$HOME/.bashrc$BACKUP_SUFFIX"
fi

cp -r "$REPO_DIR/.config/." "$HOME/.config/"
cp "$REPO_DIR/.bashrc" "$HOME/.bashrc"

echo "Dotfiles copied to $HOME"
