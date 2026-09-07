{
  flake.homeModules = { pkgs, ... }: {
    home.packages = [ pkgs.itch ];
  };
}
