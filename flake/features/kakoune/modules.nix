{ moduleWithSystem, ... }:
{
  flake.homeModules.kakoune = moduleWithSystem (
    { self', ... }:
    { pkgs, ... }:
    {
      home.packages = [
        self'.packages.kakoune-wrapped
      ];
    }
  );
}
