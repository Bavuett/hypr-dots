#!/usr/bin/env sh
set -eu

REPO_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"

mkdir -p "$HOME/.config"
cp -r "$REPO_DIR/.config/." "$HOME/.config/"
cp "$REPO_DIR/.bashrc" "$HOME/.bashrc"

echo "Dotfiles copiati in $HOME"
