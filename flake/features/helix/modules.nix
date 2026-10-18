{ moduleWithSystem, inputs, ... }: {
  flake = {
    homeModules.helix = moduleWithSystem ({ self', ... }:
      {
        programs.helix = {
          enable = true;
          package = self'.packages.helix-wrapped;
        };
      }
    );

    nixosModules.helix = moduleWithSystem ({ self', ... }:
      {
        environment.systemPackages = [ self'.packages.helix-wrapped ];
      }
    );
  };
}
