{ config, pkgs, lib, inputs, ... }:
let
  cfg = config.features;
in
{
  options.features.dev.enable = lib.mkEnableOption "Enable Dev Tools";

  config = (lib.mkIf cfg.dev.enable {
    environment.systemPackages = with pkgs; [
      vscodium-fhs
      obsidian
    ];
  });
}