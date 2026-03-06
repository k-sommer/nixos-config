{
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		hyprland.url = "github:hyprwm/Hyprland";

		caelestia-shell = {
			url = "github:caelestia-dots/shell";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		rose-pine-hyprcursor = {
			url = "github:ndom91/rose-pine-hyprcursor";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		stylix = {
			url = "github:nix-community/stylix";
			inputs.nixpkgs.follows = "nixpkgs";
		};

  	zen-browser = {
    	url = "github:0xc000022070/zen-browser-flake";
     	inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
    	url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    	inputs.nixpkgs.follows = "nixpkgs";
    };

		nix-gaming.url = "github:fufexan/nix-gaming";
		nix-citizen = {
			url = "github:LovingMelody/nix-citizen";
			inputs.nix-gaming.follows = "nix-gaming";
		};
	};

	outputs = { self, nixpkgs, home-manager, ... }@inputs:

	let
		mkHost = hostName: user: nixpkgs.lib.nixosSystem {
			specialArgs = { inherit inputs user hostName; };
			modules = [
				./hosts/${hostName}/configuration.nix
				home-manager.nixosModules.home-manager {
					home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						users.${user} = import ./modules/home/home.nix;
						extraSpecialArgs = { inherit inputs user hostName; };
					};
				}
			];
		};

	in {
		nixosConfigurations = {
			desk-01 = mkHost "desk-01" "sommer";
			lapt-01 = mkHost "lapt-01" "sommer";
#     lapt-02 = mkHost "lapt-02" "sommer"; 
			serv-01 = mkHost "serv-01" "sommer";
			held-01 = mkHost "held-01" "sommer";
		};
	};	
}