{ self, ... }: {
  flake.homeModules.questConfiguration = { pkgs, ... }: {
    home = {
      username = "quest";
      homeDirectory = "/home/quest";
      stateVersion = "26.05";
    };

    imports = [
      self.homeModules.common

      # development
      self.homeModules.git
      self.homeModules.helix
      self.homeModules.kakoune
      self.homeModules.vscode

      # productivity / misc
      self.homeModules.libre-office
      self.homeModules.anki

      # games
      self.homeModules.discord
      self.homeModules.prism-launcher
      self.homeModules.osu-lazer
      self.homeModules.itch
    ];
  };
}
