{ config, pkgs, inputs, dirs, ... }:
{
	imports = [
		./hardware-configuration.nix
    ../../modules/nixos
	];
	  	
	networking.hostName = "desk-01";

	features.gaming = {
		starCitizen.enable = true;
		steam.enable = true;
	};
  	
	services.displayManager.gdm.enable = true; 
	services.displayManager.autoLogin = {
		enable = true;
		user = "sommer";
	};

	system.stateVersion = "25.11";
}