.PHONY: up
up:
	stow fish
	stow starship
	stow zellij
	stow neovim
	stow alacritty
	stow paru
	stow hyprland
	stow hyprpaper
	stow hyprlock
	stow waybar
	stow rofi
	stow dunst
	stow fontconfig

.PHONY: pipewire
pipewire:
	systemctl enable --user pipewire.service
	systemctl enable --user pipewire-pulse.service
	systemctl enable --user wireplumber.service
