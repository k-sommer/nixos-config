{ config, pkgs, inputs, lib, hostName, ... }:
{
	imports = lib.optionals (hostName != "server-01") [
		inputs.caelestia-shell.homeManagerModules.default
		inputs.stylix.homeModules.stylix
		inputs.zen-browser.homeModules.beta
		./packages.nix
    ./hyprland.nix
    ./stylix.nix
    ./zen.nix		
	];

	home.username = "sommer";
	home.homeDirectory = "sommer";

	home.stateVersion = "25.11";
}