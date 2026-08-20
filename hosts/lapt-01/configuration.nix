{ ... }:
{
	imports = [
		./hardware-configuration.nix
		../../modules/nixos/system
		../../modules/nixos/features/desktop.nix
		../../modules/nixos/features/dev.nix
		../../modules/nixos/gaming/steam.nix
	];

	networking.hostName = "lapt-01";

	hardware.nvidia.prime = {
	  offload.enable = true;
	  offload.enableOffloadCmd = true;
   	intelBusId = "PCI:0:2:0";
   	nvidiaBusId = "PCI:1:0:0";
	};

	services.displayManager.ly.enable = true;

	system.stateVersion = "25.11";
}
