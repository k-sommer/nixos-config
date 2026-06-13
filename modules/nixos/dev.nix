{ config, pkgs, lib, inputs, ... }:
{
	programs.nix-ld.enable = true;
	environment.systemPackages = with pkgs; [
	  nixd
		zed-editor
		direnv
		obsidian
	];
}
