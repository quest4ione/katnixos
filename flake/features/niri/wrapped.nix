{ lib, inputs, ... }: {
  perSystem = { self', pkgs, ... }: {
    packages.niri-wrapped = inputs.wrapper-modules.wrappers.niri.wrap (
      {
        inherit pkgs;

        settings = {
          include = ./config.kdl;
          xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;
          spawn-at-startup = [
            (lib.getExe pkgs.noctalia)
          ];
          binds = {
            "Mod+Space".spawn-sh = "${lib.getExe pkgs.noctalia} msg panel-toggle launcher";
            "Mod+N".spawn = lib.getExe self'.packages.alacritty-wrapped;
            "Mod+B".spawn = lib.getExe pkgs.firefox;
          };
        };
      }
    );
  };
}
