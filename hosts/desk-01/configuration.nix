{ config, pkgs, inputs, dirs, ... }:
{
	imports = [
		./hardware-configuration.nix
    ../../modules/nixos
		../../modules/nixos/gui.nix
	];
	  	
	networking.hostName = "desk-01";

	features = {
		starCitizen.enable = true;
		steam.enable = true;
		xone.enable = true;
	};

	services.displayManager.gdm.enable = true;

	system.stateVersion = "25.11";
}