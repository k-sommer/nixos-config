{ config, pkgs, inputs, dirs, ... }:
{
	imports = [
		./hardware-configuration.nix
    ../../modules/nixos
		../../modules/nixos/jovian.nix
	];
	  	
	boot.kernelParams = [ "amdgpu.backlight=0" ];

	networking.hostName = "held-01";

	features.steam.enable = true;

  	services.handheld-daemon = {
  		enable = true;
  		user = "sommer";
  		ui.enable = true;
  	};

	system.stateVersion = "25.11";
}
