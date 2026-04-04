{ config, pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
  ];

  networking.hostName = "lapt-02";

  features.steam.enable = true;
  features.nvidiaLaptop.enable = true;

  jovian = {
    decky-loader.enable = true;
    steam = {
      enable = true;
      autoStart = true;
      user = "sommer";
      desktopSession = "hyprland";
    };
  };

  system.stateVersion = "25.11";
}