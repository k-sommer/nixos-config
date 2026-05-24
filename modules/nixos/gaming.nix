{ config, pkgs, lib, inputs, ... }:
let
	cfg = config.features;
in
{
	options.features = {
		starCitizen.enable = lib.mkEnableOption "Star Citizen optimizations and package";
		steam.enable = lib.mkEnableOption "Steam install";
		nvidia.enable = lib.mkEnableOption "Nvidia drivers";
		nvidiaLaptop.enable = lib.mkEnableOption "Nvidia Prime Configuration";
		xone.enable = lib.mkEnableOption "Xone drivers (including dongle firmware)";
	};

	config = lib.mkMerge [

		(lib.mkIf cfg.starCitizen.enable {
			# Build cache
			nix.settings = {
        substituters = ["https://nix-citizen.cachix.org"];
        trusted-public-keys = ["nix-citizen.cachix.org-1:lPMkWc2X8XD4/7YPEEwXKKBg+SVbYTVrAaLA2wQTKCo="];
    	};

			# Required optimizations for star citizen to be stable
			boot.kernel.sysctl = {
	 			"vm.max_map_count" = 16777216;
				"fs.file-max" = 524288;
			};

			zramSwap.enable = true;

			swapDevices = [{
				device = "/swapfile";
				size = 16 * 1024;
			}];

			environment.systemPackages = with pkgs; [
				inputs.nix-citizen.packages.${stdenv.hostPlatform.system}.rsi-launcher
			];
		})

		(lib.mkIf cfg.steam.enable {
			programs.steam = {
				enable = true;
				gamescopeSession.enable = true;
			};
		})

		(lib.mkIf cfg.nvidia.enable {
			services.xserver.videoDrivers = [ "nvidia" ];
			hardware.nvidia = {
				open = true;
				modesetting.enable = true;
			};
		})

		# Enables prime sync for laptops with nvidia cards
		(lib.mkIf cfg.nvidiaLaptop.enable {
			services.xserver.videoDrivers= [ "nvidia" ];
		 	hardware.nvidia = {
				open = true;
				modesetting.enable = true;
				prime = {
		    	sync.enable = true;
		    	intelBusId = "PCI:0:2:0";
		    	nvidiaBusId = "PCI:1:0:0";
				};
			};
		})		

		(lib.mkIf cfg.xone.enable {
			hardware.xone.enable = true;
			environment.systemPackages = with pkgs; [
				xone-dongle-firmware
			];
		})
	];
}