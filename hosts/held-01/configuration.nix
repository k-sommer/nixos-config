{ config, pkgs, inputs, dirs, ... }:
{
	imports = [
		./hardware-configuration.nix
    ../../modules/nixos
	];
	  	
	networking.hostName = "held-01";

	features.steam.enable = true;

  	services.handheld-daemon = {
  		enable = true;
  		user = "sommer";
  		ui.enable = true;
  	};
  	services.displayManager.gdm.enable = true;
  	services.displayManager.autoLogin = {
  		enable = true;
  		user = "sommer";
  	};

	system.stateVersion = "25.11";
}
