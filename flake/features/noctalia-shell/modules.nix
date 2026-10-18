{ inputs, ... }: {
  flake.homeModules.noctalia-shell = { pkgs, ... }: {
    home.packages = [ pkgs.playerctl ];
  };

  flake.nixosModules.noctalia-shell = { ... }: {
    services.upower.enable = true;
  };
}
