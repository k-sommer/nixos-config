{ pkgs, ... }:
{
	stylix = {
		enable = true;
		# https://github.com/tinted-theming/schemes
		base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
		polarity = "dark";

		icons = {
			enable = true;
			dark = "Adwaita";
			package = pkgs.adwaita-icon-theme;
		};
	};
}
