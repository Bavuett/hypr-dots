# hypr-dots 🌸

A pastel-themed Hyprland rice for Fedora, inspired by [ViegPhunt/Dotfiles](https://github.com/ViegPhunt/Dotfiles).

## 🎨 Color Palette

| Role       | Color     | Preview |
|------------|-----------|---------|
| Primary    | `#f5b8c6` | 🌸 Pastel Pink |
| Secondary  | `#fffaa0` | 🌼 Pastel Yellow |
| Tertiary   | `#aec6cf` | 🩵 Pastel Blue |
| Background | `#1e1a2e` | 🌑 Deep Purple |
| Foreground | `#f2e8f5` | 🤍 Soft White |

## 📦 Included Configurations

- **Window Manager**: `Hyprland` with pastel borders and blur
- **Terminal**: `kitty` with pastel color scheme
- **Shell**: `bash` with Starship prompt
- **Prompt**: `starship` (pastel theme)
- **Status Bar**: `waybar` with pastel styling
- **Launcher**: `wofi` (pastel styled)
- **Notifications**: `swaync`
- **Logout Menu**: `wlogout`
- **Lockscreen**: `hyprlock`

## 📂 Structure

```
.
├── .config/
│   ├── colors/         # Shared pastel color scheme (CSS variables)
│   ├── hypr/           # Hyprland + hyprlock config
│   │   └── conf/       # Modular hyprland configs
│   ├── kitty/          # Kitty terminal config
│   ├── waybar/         # Status bar config and style
│   ├── wofi/           # App launcher config and style
│   ├── swaync/         # Notification center config and style
│   ├── wlogout/        # Logout menu config and style
│   └── starship.toml   # Starship prompt config
├── .bashrc             # Bash configuration
└── README.md
```

## 🚀 Installation (Fedora)

### 1. Install dependencies

```bash
sudo dnf install -y \
    hyprland \
    hyprlock \
    waybar \
    kitty \
    wofi \
    swaync \
    wlogout \
    swww \
    hyprshot \
    cliphist \
    wl-clipboard \
    polkit-gnome \
    nm-applet \
    brightnessctl \
    playerctl \
    blueman \
    pavucontrol \
    nemo \
    firefox

# Install starship prompt
curl -sS https://starship.rs/install.sh | sh

# Install JetBrainsMono Nerd Font
sudo dnf install -y jetbrains-mono-fonts
# Or download from: https://www.nerdfonts.com/font-downloads
```

### 2. Clone and deploy

```bash
git clone https://github.com/Bavuett/hypr-dots.git
cd hypr-dots

# Copy configs
cp -r .config/* ~/.config/
cp .bashrc ~/.bashrc

# Reload bash
source ~/.bashrc
```

### 3. Set a wallpaper

```bash
# Start swww daemon and set wallpaper
swww-daemon &
swww img /path/to/your/wallpaper.jpg --transition-type fade
```

## ⌨️ Key Bindings

| Keybind | Action |
|---------|--------|
| `Super + Space` | Open terminal (kitty) |
| `Alt + Space` | Open app launcher (wofi) |
| `Super + B` | Open browser (firefox) |
| `Super + E` | Open file manager |
| `Super + Q` | Close window |
| `Super + F` | Toggle floating |
| `Super + L` | Lock screen (hyprlock) |
| `Super + V` | Clipboard history |
| `Super + Shift + S` | Screenshot region |
| `Super + 1-0` | Switch workspace |
| `Super + Shift + 1-0` | Move window to workspace |
| `Super + Arrows` | Move focus |

## 🎨 Customization

The color palette is centralized in `.config/colors/colors.css`. All components (waybar, swaync, wlogout, wofi) import from this file, so you can change colors in one place.

The Starship prompt colors are configured in `.config/starship.toml`.
The Kitty terminal colors are in `.config/kitty/kitty.conf`.
