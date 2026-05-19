{ config, pkgs, inputs, dirs, ... }:
{
	imports = [
		./hardware-configuration.nix
    ../../modules/nixos
	];
	  	
	networking.hostName = "desk-01";

	features = {
		gui.enable = true;
		dev.enable = true;
		starCitizen.enable = true;
		steam.enable = true;
		jovian.enable = true;
	};

	system.stateVersion = "25.11";
}