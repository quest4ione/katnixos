{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: {
    nixosConfigurations.katnix = inputs.nixpkgs.lib.nixosSystem {
      modules = [
        inputs.disko.nixosModules.disko
        ./flake/configuration.nix
      ];
    };
  };
}
