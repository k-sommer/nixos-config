{ config, pkgs, inputs, lib, hostName, ... }:
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

	programs.caelestia.enable = true;
		home.file.".config/caelestia".source = 
			config.lib.file.mkOutOfStoreSymlink "/home/sommer/nixos-config/dotfiles/caelestia";

	home.username = "sommer";
	home.homeDirectory = "/home/sommer";

	home.stateVersion = "25.11";
}