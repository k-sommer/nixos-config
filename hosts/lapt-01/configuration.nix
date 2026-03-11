{ config, pkgs, inputs, dirs, ... }:
{
	imports = [
		./hardware-configuration.nix
    ../../modules/nixos
	];
	  	
	networking.hostName = "lapt-01";

	features = {
		nvidiaLaptop.enable = true;
		starCitizen.enable = true;
		steam.enable = true;
	};
  	
	services.displayManager.gdm.enable = true;

	system.stateVersion = "25.11";
}