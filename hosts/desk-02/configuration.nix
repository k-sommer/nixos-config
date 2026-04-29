{ config, pkgs, inputs, dirs, ... }:
{
	imports = [
		./hardware-configuration.nix
    ../../modules/nixos
		../../modules/nixos/jovian.nix
	];
	  	
	networking.hostName = "desk-02";

	features = {
		starCitizen.enable = true;
		steam.enable = true;
		nvidia.enable = true;
	};

	system.stateVersion = "25.11";
}