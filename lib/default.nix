{
  inputs,
  stateVersion,
  ...
}: {
  mkHome = {
    username ? "ow1",
    hostname ? "nixos",
    platform ? "x86_64-linux",
  }:
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = inputs.nixpkgs.legacyPackages.${platform};
      extraSpecialArgs = {
        inherit inputs platform username hostname stateVersion;
      };

      modules = [
        ../home
      ];
    };
}
