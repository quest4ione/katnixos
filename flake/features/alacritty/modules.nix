{ moduleWithSystem, ... }:
{
  flake = {
    nixosModules.alacritty = moduleWithSystem ({ self', ... }:
      {
        environment.systemPackages = [ self'.packages.alacritty-wrapped ];
      }
    );
  };
}
