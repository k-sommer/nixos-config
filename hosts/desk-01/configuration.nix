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

	services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTRS{idVendor}=="231d", MODE="0666", GROUP="input"
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="231d", MODE="0666", GROUP="input"
	'';

	system.stateVersion = "25.11";
}
