{
  perSystem =
    { pkgs, ... }:
    {
      packages.kakoune-wrapped = pkgs.kakoune.override {
        plugins = with pkgs.kakounePlugins; [
          kakoune-lsp
        ];
      };
    };
}
