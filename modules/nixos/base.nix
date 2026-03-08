{ config, pkgs, inputs, ... }:
{
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.kernelPackages = pkgs.linuxPackages_latest;

	networking.networkmanager.enable = true;

	time.timeZone = "America/Denver";
	  	
	i18n.defaultLocale = "en_US.UTF-8";
	i18n.extraLocaleSettings = {
	  LC_ADDRESS = "en_US.UTF-8";
	  LC_IDENTIFICATION = "en_US.UTF-8";
	  LC_MEASUREMENT = "en_US.UTF-8";
	  LC_MONETARY = "en_US.UTF-8";
	  LC_NAME = "en_US.UTF-8";
	  LC_NUMERIC = "en_US.UTF-8";
	  LC_PAPER = "en_US.UTF-8";
	  LC_TELEPHONE = "en_US.UTF-8";
	  LC_TIME = "en_US.UTF-8";
	};

	hardware.graphics = {
		enable = true;
		package = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.mesa;
		enable32Bit = true;
		package32 = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.pkgsi686Linux.mesa;
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

	users.users.sommer = {
		isNormalUser = true;
	  description = "sommer";
	  extraGroups = [ "networkmanager" "wheel" ];
		shell = pkgs.fish;
	};

	nixpkgs.config.allowUnfree = true;
	programs.fish.enable = true;

	environment.systemPackages = with pkgs; [
		git
		micro-full
	];
}