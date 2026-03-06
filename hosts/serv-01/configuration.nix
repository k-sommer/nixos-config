{ config, pkgs, inputs, dirs, ... }:
{
	imports = [
		./hardware-configuration.nix
    ../../modules/nixos/base.nix
	];
	  	
	networking.hostName = "serv-01";

	system.stateVersion = "25.11";
}