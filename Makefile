STOW_APPS = fish starship zellij neovim alacritty paru hyprland hyprpaper hyprlock waybar rofi dunst fontconfig ssh nix

.PHONY: all
all: $(STOW_APPS) pipewire

.PHONY: $(STOW_APPS)
$(STOW_APPS):
	stow $@

.PHONY: pipewire
pipewire:
	systemctl enable --user pipewire.service
	systemctl enable --user pipewire-pulse.service
	systemctl enable --user wireplumber.service
