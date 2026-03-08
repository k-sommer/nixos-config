{ config, pkgs, ... }:
{
  programs.caelestia = {
    enable = true;
    cli.enable = true;
    settings = {
      bar.workspaces.shown = 4;
      launcher = {
        showOnHover = true;
        hiddenApps = [
          "org.gnome.Evince"
          "org.gnome.eog"
          "org.flameshot.Flameshot"
          "kvantummanager"
          "micro"
          "nixos-manual"
          "qt5ct"
          "qt6ct"
          "xterm"
          "org.gnome.Totem"
        ];
      };
      services.useFahrenheitPerformance = false;
      paths.sessionGif = "/home/sommer/nixos-config/assets/nixos.png";
    };
  };
}  