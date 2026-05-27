{ config, pkgs, lib, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
      vscodium-fhs
      obsidian
    ];
}