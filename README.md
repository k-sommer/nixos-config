# ❄️ NixOS configuration
This repo contains my NixOS configuration files used to build and manage my system environments across multiple device types.
# 🏗️ Structure
Like others I have structured my files in a modular manner, focusing on using toggles to enable certain features (e.g. desktop environment, steam, dev tools, etc). The (nixos directory)[./modules/nixos] is used for the core configuration modules, while the (home directory)[./modules/home] is used for home-manager modules which are not currently toggleable.
# ⚪ Feature toggles
| Toggles |Description |
|---------|------------|
|```features.dev.enable```| Installs vscodium and obisidan packages |
|```features.starCitizen.enable``` | Installs the RSI launcher and makes changes to the kernel for stability |
|```features.steam.enable``` | Installs the steam client and gamescope |
|```features.nvidia.enable``` | Installs the current Nvidia drivers|
|```features.nvidiaPrime.enable``` | Installs the current Nvidia drivers and enables prime sync. The bus ID's are currently hardcoded|
<details>
<summary>Screenshots</summary>
![image](assets/screenshot-1.jpeg)
![image](assets/screenshot-2.jpeg)
![image](assets/screenshot-3.jpeg)
![image](assets/screenshot-4.jpeg)
</details>
# ✔️ To Do
- [ ] Enable secrets implimentation using either sops-nix or agenix
- [ ] Remove hardcoded bus ID's in favor of using mkOption