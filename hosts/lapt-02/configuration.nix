{ config, pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
    ../../modules/nixos/gui.nix
  ];

  networking.hostName = "lapt-02";

  features.steam.enable = true;
  features.nvidiaLaptop.enable = true;

  services.displayManager.gdm.enable = true;
 
  system.stateVersion = "25.11";
}