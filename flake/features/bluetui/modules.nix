{
  flake.nixosModules.bluetui = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.bluetui ];
  };
}

