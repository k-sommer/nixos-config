{ config, pkgs, lib, inputs, ... }:
let
  cfg = config.features;
in
{
  options.features.jovian.enable = lib.mkEnableOption "Enable Jovian NixOS";

  config = (lib.mkIf cfg.jovian.enable {
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
  });
}




