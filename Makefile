.PHONY: all
all: fish starship zellij neovim alacritty paru hyprland hyprpaper hyprlock waybar rofi dunst fontconfig pipewire

.PHONY: fish
fish:
	stow fish
.PHONY: starship
starship:
	stow starship
.PHONY: zellij
zellij:
	stow zellij
.PHONY: neovim
neovim:
	stow neovim
.PHONY: alacritty
alacritty:
	stow alacritty
.PHONY: paru
paru:
	stow paru
.PHONY: hyprland
hyprland:
	stow hyprland
.PHONY: hyprpaper
hyprpaper:
	stow hyprpaper
.PHONY: hyprlock
hyprlock:
	stow hyprlock
.PHONY: waybar
waybar:
	stow waybar
.PHONY: rofi
rofi:
	stow rofi
.PHONY: dunst
dunst:
	stow dunst
.PHONY: fontconfig
fontconfig:
	stow fontconfig

.PHONY: pipewire
pipewire:
	systemctl enable --user pipewire.service
	systemctl enable --user pipewire-pulse.service
	systemctl enable --user wireplumber.service
