{ ... }:
{
  jovian = {
    # Disabled for now due to CVE-2026-48995
    decky-loader.enable = false;
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
}
