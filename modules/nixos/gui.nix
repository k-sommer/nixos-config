{ pkgs, inputs, ... }:
{
	# Hyprland cache to speed up building
	nix.settings = {
		substituters = ["https://hyprland.cachix.org"];
		trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
	};

	hardware.bluetooth.enable = true;

	# Realtime priority for pulseaudo and pipewire
	security.rtkit.enable = true;

	# Services for functional shell, usually installed automatically with
	# with most desktop environments.
	services.gvfs.enable = true;
	services.dbus.enable = true;
	services.udisks2.enable = true;
	services.flatpak.enable = true;
	services.upower.enable = true;
	services.power-profiles-daemon.enable = true;
	programs.dconf.enable = true;
	services.gnome.gnome-keyring.enable = true;
	security.pam.services.login.enableGnomeKeyring = true;
	services.mullvad-vpn.enable = true;
	services.resolved.enable = true;
	services.pulseaudio.enable = false;
	services.pipewire = {
	  enable = true;
	  alsa.enable = true;
	  alsa.support32Bit = true;
	  pulse.enable = true;
	};
	services.hardware.openrgb = {
		enable = true;
		motherboard = "amd";
	};

	virtualisation.libvirtd.enable = true;

	programs.gamemode.enable = true;
	programs.hyprland.enable = true;

	nixpkgs.overlays = [
  	# Skipping tests while upstream sorts it out, revert once lutris builds
  	(final: prev: {
  		openldap = prev.openldap.overrideAttrs (_: {
  			doCheck = false;
 			});
  	})
  ];

	environment.systemPackages = with pkgs; [
		inputs.rose-pine-hyprcursor.packages.${stdenv.hostPlatform.system}.default
		inputs.zen-browser.packages.${stdenv.hostPlatform.system}.default
		brightnessctl
	  playerctl
	  hyprpolkitagent
	  nautilus
	  mission-center
		lutris
	  baobab
	  eog
	  totem
		transmission_4-gtk
	 	evince
	 	gnome-software
		dnsmasq
	 	grim
	 	flameshot
		mullvad-vpn
		openra
		prismlauncher
	];
}
