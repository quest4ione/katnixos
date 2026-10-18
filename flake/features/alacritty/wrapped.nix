{ lib, inputs, ... }: {
  perSystem = { self', pkgs, ... }: {
    packages.alacritty-wrapped = inputs.wrapper-modules.wrappers.alacritty.wrap {
      inherit pkgs;

      settings = {
        window = {
          decorations = "None";
        };
      };
    };
  };
}
