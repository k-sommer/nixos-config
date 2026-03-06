{ config, pkgs, inputs, lib, hostName, ... }:
{
	imports = lib.optionals (hostName != "server-01") [
		inputs.caelestia-shell.homeManagerModules.default
		inputs.stylix.homeModules.stylix
		inputs.zen-browser.homeModules.beta
		./programs.nix
    ./hyprland.nix
    ./stylix.nix
    ./zen.nix		
	];

	home.username = "sommer";
	home.homeDirectory = "/home/sommer";

	home.stateVersion = "25.11";
}