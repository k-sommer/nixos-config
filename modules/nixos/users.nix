{ config, pkgs, ... }:
{
  users.mutableUsers = false;

 	age.secrets.secret1.file = ../../secrets/secret1.age;

	users.users.sommer = {
		isNormalUser = true;
		hashedPasswordFile = config.age.secrets.secret1.path;
	  description = "sommer";
	  extraGroups = [ "networkmanager" "wheel" "libvirtd" "adbusers" ];
		shell = pkgs.fish;
	};
}
