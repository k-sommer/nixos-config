{ config, pkgs, lib, inputs, hostName, ... }:
let
	# Monitor arrangements per host
	displays = lib.mkMerge [
		(lib.mkIf (hostName == "held-01") [
			"eDP-1, preferred, auto, 2, transform, 1"
			"DP-3, preferred, auto-right, 2"
		])
		(lib.mkIf (hostName == "desk-01") [
			"DP-1, 2560x1440@144, auto, auto"
			"HDMI-A-1, 1920x1080@120, auto-right, 1"
			"DP-2, 2560x1440@144, auto-left, auto"			
		])
	];	

	# Touchscreen rotation for legion go native portrait display
	touchScreen = 
		lib.mkIf (hostName == "held-01") { transform = 1; };
	
	hardwareCursor = 
		lib.mkIf (hostName == "held-01") { no_hardware_cursors = 1; };
in
{
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk xdg-desktop-portal-hyprland ];
    config = {
      hyprland = {
        default = [ "hyprland" "gtk" ];
        "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
      };
    };
  };	

	wayland.windowManager.hyprland = {
		enable = true;

		settings = {

			monitor = [ displays ];

			exec-once = "";

			env = [
				"HYPRCURSOR_THEME, rose-pine-hyprcursor"
			];

			xwayland = {
				force_zero_scaling = true;
			};
			
			cursor = {} // hardwareCursor;

			general = {
				exec = "hyprctl dispatch submap global";
				submap = "global";
				layout = "dwindle";
				gaps_in = 5;
				gaps_out = 10;
				border_size = 0;
			};

			decoration = {
				rounding = 15;
			};
			
			input = {
				numlock_by_default = true;
				touchpad = {
					natural_scroll = true;
					clickfinger_behavior = true;
				};
				touchdevice = {} // touchScreen;
				tablet.output = "HDMI-A-1";
			};
			
			bind = [
				"SUPER, Q, exec, kitty"
				"SUPER, C, killactive"
				"SUPER, F, fullscreen"			
				# Window navigation
				"SUPER, left, movefocus, l"
				"SUPER, right, movefocus, r"
				"SUPER, up, movefocus, u"
				"SUPER, down, movefocus, d"
				"SUPER SHIFT, left, movewindow, l"
				"SUPER SHIFT, right, movewindow, r"
				"SUPER SHIFT, up, movewindow, u"
				"SUPER SHIFT, down, movewindow, d"
				# Workspace navigation
				"SUPER, 1, workspace, 1"
				"SUPER, 2, workspace, 2"
				"SUPER, 3, workspace, 3"
				"SUPER, 4, workspace, 4"
				# Move active window to a workspace
				"SUPER SHIFT, 1, movetoworkspace, 1"
				"SUPER SHIFT, 2, movetoworkspace, 2"
				"SUPER SHIFT, 3, movetoworkspace, 3"
				"SUPER SHIFT, 4, movetoworkspace, 4"
				# Caelestia-shell binds
				"SUPER, space, global, caelestia:launcher"
				"SUPER, print, exec, flameshot full --path /home/sommer/Pictures/Screenshots"
			];

			bindel = [
				", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
				", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-"
				", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
				", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
				", XF86MonBrightnessUp, exec, brightnesctl -e4 -n2 set 5%+"
				", XF86MonBrightnessDown, exec, brightnesctl -e4 -n2 set 5%-"
			];

			bindl = [
				", XF86AudioPlay, exec, playerctl play-pause"
				", XF86AudioPrev, exec, playerctl previous"
				", XF86AudioNext, exec, playerctl next"
			];

			gesture = "3, horizontal, workspace";

			misc = {
				disable_hyprland_logo = true;
				force_default_wallpaper = 0;
			};
		};
	};
}
