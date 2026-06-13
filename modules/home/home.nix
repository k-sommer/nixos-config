{ config, inputs, user, ... }:
let
	dotfiles = "/home/${user}/nixos-config/dotfiles";
in
{
	imports = [
		inputs.caelestia-shell.homeManagerModules.default
		inputs.stylix.homeModules.stylix
		inputs.zen-browser.homeModules.beta
		./programs.nix
    	./hyprland.nix
	   	./stylix.nix
    	./zen.nix
	];

	programs.caelestia = {
		enable = true;
		cli.enable = false;
	};
		home.file.".config/caelestia".source =
			config.lib.file.mkOutOfStoreSymlink "${dotfiles}/caelestia";

	home.username = "sommer";
	home.homeDirectory = "/home/sommer";

	home.stateVersion = "25.11";
}
