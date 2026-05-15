{ config, pkgs, inputs, ... }:
{

	# Hyprland cache to speed up building
	nix.settings = {
		substituters = ["https://hyprland.cachix.org"];
		trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
	};

	# Potential point of issue with hyprland?
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
    config = {
      hyprland = {
        default = [ "hyprland" "gtk" ];
        "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
      };
    };
  };

	hardware.bluetooth.enable = true;
	hardware.xone.enable = true;

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

# Needed for running 25.11 stable
#	nixpkgs.overlays = [
#  	(final: prev: {
#    	xrdb = prev.xorg.xrdb or prev.xrdb;
#	  })
#	];

	environment.systemPackages = with pkgs; [
		inputs.rose-pine-hyprcursor.packages.${stdenv.hostPlatform.system}.default
		inputs.zen-browser.packages.${stdenv.hostPlatform.system}.default
		brightnessctl
	  playerctl
	  hyprpolkitagent
		adwaita-icon-theme
		openrgb-with-all-plugins
	  vscodium-fhs
	  nautilus
	  mission-center
		xone-dongle-firmware
		protonup-qt
		lutris
	  baobab
	  eog
	  totem
		transmission_4-gtk
	 	evince
	 	gnome-software
		virt-manager
		dnsmasq
	 	grim
	 	flameshot
		mullvad-vpn
		krita
		tor-browser
		openra
		prismlauncher
	];
}