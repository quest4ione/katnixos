{
  imports = [
    ./hardware-configuration.nix
    ./disko.nix
  ];

  system.stateVersion = "25.11";
  nix.settings.experimental-features = [ "flakes" "nix-command" ];

  networking.hostName = "katnix";

  users = {
    groups.kat = {};
    users.kat = {
      isNormalUser = true;
      group = "kat";
      hashedPassword = "$y$j9T$FUpgKpi9MV7mATNyxzRFM0$NzzNawim8jgBZY.kV5wAVNflksLAy6aAfHZS1SDxgX3";
      extraGroups = [ "wheel" ];
    };
  };
}
