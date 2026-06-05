{ config, pkgs, lib, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
      direnv
      vscodium-fhs
      obsidian
    ];
}