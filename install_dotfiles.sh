#!/usr/bin/env sh
set -eu

REPO_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
BACKUP_SUFFIX=".bak.$(date +%Y%m%d%H%M%S)"
BACKUP_DIR="$HOME/.dotfiles-backup$BACKUP_SUFFIX"

mkdir -p "$HOME/.config"

for source in "$REPO_DIR"/.config/*; do
  item="$(basename "$source")"
  target="$HOME/.config/$item"
  if [ -e "$target" ]; then
    mkdir -p "$BACKUP_DIR/.config"
    cp -r "$target" "$BACKUP_DIR/.config/$item"
  fi
done

if [ -f "$HOME/.bashrc" ]; then
  mkdir -p "$BACKUP_DIR"
  cp "$HOME/.bashrc" "$BACKUP_DIR/.bashrc"
fi

cp -r "$REPO_DIR/.config/." "$HOME/.config/"
if [ -f "$REPO_DIR/.bashrc" ]; then
  cp "$REPO_DIR/.bashrc" "$HOME/.bashrc"
fi

echo "Dotfiles copied to $HOME"
echo "Backups (if created): $BACKUP_DIR"
