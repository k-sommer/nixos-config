{ config, pkgs, inputs, dirs, ... }:
{
	imports = [
		./hardware-configuration.nix
    ../../modules/nixos
		../../modules/nixos/gui.nix
		../../modules/nixos/dev.nix
	];
	  	
	networking.hostName = "lapt-01";

	features = {
		nvidiaLaptop.enable = true;
		steam.enable = true;
		xone.enable = true;
	};
  	
	services.displayManager.gdm.enable = true;

	system.stateVersion = "25.11";
}