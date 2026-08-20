{ pkgs, inputs, ... }:
{
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
		size = 32 * 1024;
	}];

	environment.systemPackages = with pkgs; [
		inputs.nix-citizen.packages.${stdenv.hostPlatform.system}.rsi-launcher
	];
}
