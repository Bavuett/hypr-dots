#!/usr/bin/env sh
# install_dotfiles.sh — Hypr-dots installer
# Installs config files to $HOME/.config and wallpaper.
# Does NOT touch .bashrc or any other shell config.
set -eu

REPO_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
BACKUP_SUFFIX=".bak.$(date +%Y%m%d%H%M%S)"
BACKUP_DIR="$HOME/.dotfiles-backup$BACKUP_SUFFIX"

echo "==> Hypr-dots installer"
echo "    Repo : $REPO_DIR"
echo "    Backup dir (if needed): $BACKUP_DIR"
echo ""

# ── 1. Backup existing .config entries ──────────────────────
mkdir -p "$HOME/.config"

for source in "$REPO_DIR"/.config/*; do
  item="$(basename "$source")"
  target="$HOME/.config/$item"
  if [ -e "$target" ]; then
    mkdir -p "$BACKUP_DIR/.config"
    cp -r "$target" "$BACKUP_DIR/.config/$item"
    echo "  backed up ~/.config/$item"
  fi
done

# ── 2. Copy config files ─────────────────────────────────────
cp -r "$REPO_DIR/.config/." "$HOME/.config/"
echo "==> Config files copied to ~/.config/"

# ── 3. Install wallpaper ─────────────────────────────────────
if [ -f "$REPO_DIR/wallpaper.jpg" ]; then
  mkdir -p "$HOME/.config/hypr"
  cp "$REPO_DIR/wallpaper.jpg" "$HOME/.config/hypr/wallpaper.jpg"
  echo "==> Wallpaper installed to ~/.config/hypr/wallpaper.jpg"
fi

# ── 4. Create XDG user directories ───────────────────────────
if command -v xdg-user-dirs-update >/dev/null 2>&1; then
  xdg-user-dirs-update
  echo "==> XDG user directories updated"
fi

# ── 5. Font cache ─────────────────────────────────────────────
if command -v fc-cache >/dev/null 2>&1; then
  fc-cache -fv >/dev/null 2>&1
  echo "==> Font cache refreshed"
fi

echo ""
echo "✓ Done. Backups (if any): $BACKUP_DIR"
echo ""
echo "NOTE: Install dependencies first with:"
echo "  See dependencies.txt for instructions."
