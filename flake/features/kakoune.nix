{ moduleWithSystem, ... }:
{
  flake.homeModules.kakoune = moduleWithSystem  (
    { self', ... }:
    { pkgs, ... }:
    {
      home.packages = [
        self'.packages.kakoune
      ];
    });

  perSystem =
    { pkgs, ... }:
    {
      packages.kakoune = pkgs.kakoune.override {
        plugins = with pkgs.kakounePlugins; [
          kakoune-lsp
        ];
      };
    };
}
