{ pkgs, inputs, ... }:
{
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	# Only needed for unstable nixpkgs in flake.nix
	boot.kernelPackages = pkgs.linuxPackages_latest;

	networking.networkmanager.enable = true;

	hardware.graphics = {
		enable = true;
		enable32Bit = true;
	};

	services.hardware.bolt.enable = true;
	services.openssh.enable = true;
	services.tailscale.enable = true;
	services.xserver.enable = true;
	services.xserver.xkb = {
	  layout = "us";
	  variant = "";
	};

	# Garbage collect to automatically clear old generations after 2 days
	nix.gc = {
		automatic = true;
		dates = "daily";
		options = "--delete-older-than 2d";
	};

	environment.variables.EDITOR = "micro";

	nixpkgs.config.allowUnfree = true;
	programs.fish.enable = true;

	environment.systemPackages = with pkgs; [
		inputs.agenix.packages.x86_64-linux.default
		git
		micro-full
	];
}
