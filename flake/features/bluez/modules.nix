{
  flake.nixosModules.bluez = { pkgs, ... }: {
    hardware.bluetooth.enable = true;
  };
}
