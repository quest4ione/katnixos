{
  flake.homeModules.itch = { pkgs, ... }: {
    home.packages = [ pkgs.itch ];
  };
}
