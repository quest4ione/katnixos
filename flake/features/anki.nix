{
  flake = {
    homeModules.anki = { pkgs, ... }: {
      programs.anki.enable = true;
    };
  };
}
