{ moduleWithSystem, ... }: {
  flake = {
    homeModules.zellij = moduleWithSystem ({ self', ... }:
      { pkgs, ... }:
      {
        home.packages = [ pkgs.zellij ];
      }
    );
  };
}
