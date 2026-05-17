{ config, pkgs, inputs, dirs, ... }:
{
	imports = [
		./hardware-configuration.nix
    ../../modules/nixos
		../../modules/nixos/dev.nix
	];
	  	
	networking.hostName = "lapt-01";

	features = {
		gui.enable = true;
		dev.enable = true;
		nvidiaLaptop.enable = true;
		starCitizen.enable = true;
		steam.enable = true;
	};
  	
	services.displayManager.gdm.enable = true;

	system.stateVersion = "25.11";
}