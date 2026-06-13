{ config, pkgs, lib, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
      direnv
      obsidian
      jetbrains.rust-rover
    ];
}