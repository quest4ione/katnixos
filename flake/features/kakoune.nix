{
  flake.homeModules.kakoune = { pkgs, ... }: {
    packages = [
      pkgs.kakoune
    ];
  };
}
