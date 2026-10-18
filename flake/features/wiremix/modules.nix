{
  flake.nixosModules.wiremix = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.wiremix ];
  };
}

