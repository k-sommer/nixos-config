{ ... }:
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

	services.displayManager = {
		ly.enable = true;
		autoLogin = {
			enable = true;
			user = "sommer";
		};
	};

	system.stateVersion = "25.11";
}
