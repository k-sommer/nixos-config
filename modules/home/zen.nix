{ inputs, ... }:
{
  	programs.zen-browser = {
    	enable = true;
			profiles = {
    		default = {
				extensions.packages = with inputs.firefox-addons.packages.x86_64-linux; [
					ublock-origin
					bitwarden
					privacy-badger ];
      	};
    	};
  	};

  stylix.targets.zen-browser.profileNames = [ "default" ];
}
