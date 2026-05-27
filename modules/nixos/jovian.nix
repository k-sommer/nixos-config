{ config, pkgs, lib, inputs, ... }:
{
  jovian = {
    decky-loader.enable = true;
    hardware = {
      has.amd.gpu = true;
      amd.gpu.enableBacklightControl = true;
    };
    steam = {
      enable = true;
      autoStart = true;
      user = "sommer";
      desktopSession = "hyprland";
    };
  };  
}




