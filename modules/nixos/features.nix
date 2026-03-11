{ config, pkgs, lib, inputs, ... }:
let
	cfg = config.features;
in
{
	options.features = {
		starCitizen.enable = lib.mkEnableOption "Star Citizen optimizations and package";
		steam.enable = lib.mkEnableOption "Steam install";
		nvidiaLaptop.enable = lib.mkEnableOption "Nvidia Prime Configuration";
	};

	config = lib.mkMerge [

		(lib.mkIf cfg.starCitizen.enable {
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

		# Enables prime sync for laptops with nvidia cards
		(lib.mkIf cfg.nvidiaLaptop.enable {
			services.xserver.videoDrivers= [ "nvidia" ];
		 	hardware.nvidia.open = true;
		 	hardware.nvidia.prime = {
		    	sync.enable = true;
		    	intelBusId = "PCI:0:2:0";
		    	nvidiaBusId = "PCI:1:0:0";
			};
		})		
	];
}