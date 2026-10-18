{ self, inputs, ... }:
{
  flake.nixosModules.hpPavilionConfiguration = { pkgs, ... }: {
    imports = [
      inputs.home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit inputs; };
        home-manager.users = {
          quest = self.homeModules.questConfiguration;
        };
      }
    ];

    users.users.quest = {
      isNormalUser = true;
      extraGroups = [ "wheel" "docker" "dialout" ];
    };
  };
}
