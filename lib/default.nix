{
  inputs,
  stateVersion,
  ...
}: {
  mkHome = {
    username ? "ow1",
    hostname ? "nixos",
    platform ? "x86_64-linux",
  }: let
    isWsl = (hostname == "wsl");
  in
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = inputs.nixpkgs.legacyPackages.${platform};
      extraSpecialArgs = {
        inherit inputs platform username hostname stateVersion isWsl;
      };

      modules = [
        ../home
      ];
    };

  # Helper function for generating host configs
  mkHost = {
    hostname ? "nixos",
    username ? "ow1",
    platform ? "x86_64-linux",
  }:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs hostname username platform stateVersion;
      };

      modules = [
        ../system
      ];
    };
}
