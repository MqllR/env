# Env

Install and setup tools with Makefiles.

##### OS Supported

### Git

### Tmux

### Vim

### Go

### Kubectl

### Bash

### Fish

### Sway

Sway desktop: sway, waybar, mako, rofi and their side tools (swaylock/swayidle, grim/slurp, brightnessctl, playerctl, pavucontrol, polkit agent, nm-applet, portals) plus the JetBrainsMono Nerd Font.

```
make -f Makefile.sway            # packages, font, dirs, config
make -f Makefile.sway config     # only (re)link configs
```

Configs live in `config/<tool>/`; `~/.config/<tool>` is a symlink to it.
Machine-specific: `config/sway/conf.d/*.conf` (outputs, untracked, seeded from `*.example`) and the untracked wallpaper `~/Pictures/wallpaper.jpg`.
