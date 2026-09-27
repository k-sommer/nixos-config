{ ... }:
{
	imports = [
		./hardware-configuration.nix
		../../modules/nixos/system
		../../modules/nixos/features/desktop.nix
		../../modules/nixos/gaming/steam.nix
	];

	boot.kernelParams = [ "amdgpu.backlight=0" ];

	networking.hostName = "held-01";

	services.inputplumber.enable = true;
	services.displayManager = {
		ly.enable = true;
		autoLogin = {
			enable = true;
			user = "sommer";
		};
	};

	system.stateVersion = "25.11";
}
