{
  flake.nixosModules.kde = {
    services = {
      desktopManager.plasma6.enable = true;
    };
    services.power-profiles-daemon.enable =  false;
    services.xserver.enable = true;
  };
}
