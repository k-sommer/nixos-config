{ ... }:
{
	imports = [
		./hardware-configuration.nix
    ../../modules/nixos/system
		../../modules/nixos/features/desktop.nix
		../../modules/nixos/gaming/steam.nix
		../../modules/nixos/gaming/star-citizen.nix
	];

	networking.hostName = "desk-01";

	services.displayManager = {
		ly.enable = true;
		autoLogin = {
			enable = true;
			user = "sommer";
		};
	};

	# For VKB flight stick
	services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTRS{idVendor}=="231d", MODE="0666", GROUP="input"
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="231d", MODE="0666", GROUP="input"
	'';

	system.stateVersion = "25.11";
}
