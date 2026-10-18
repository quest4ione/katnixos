{ self, inputs, ... }: {
  flake.nixosModules.hpPavilionConfiguration = { pkgs, ... }: {
    networking.hostName = "hp-pavilion";
    system.stateVersion = "25.11";

    nixpkgs.config.allowUnfree = true;

    environment.variables = {
      EDITOR = "hx";
      VISUAL = "hx";
    };

    imports = [
      self.nixosModules.common
      self.nixosModules.locale

      # misc
      self.nixosModules.nix-ld

      # essential features
      self.nixosModules.network-manager
      self.nixosModules.pipewire
      self.nixosModules.bluez
      self.nixosModules.printing

      # bootloaders, display managers, compositors, etc.
      self.nixosModules.grub
      self.nixosModules.ly
      self.nixosModules.niri
      self.nixosModules.kde

      # other essential system programs
      self.nixosModules.bluetui
      self.nixosModules.wiremix
      self.nixosModules.firefox
      self.nixosModules.helix

      # these need system installation to work i think
      self.nixosModules.docker
      self.nixosModules.flatpak
      self.nixosModules.keyd
      self.nixosModules.steam
    ];
  };
}
