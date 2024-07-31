{
  description = "ow1 flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # NixOS community
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";

    ags.url = "github:Aylur/ags";

    # Hyprland ecosystem
    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1&ref=refs/tags/v0.41.1";
    };

    # Just for pretty flake.nix
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    # My neovim config
    ow1dev-nvim.url = "github:Ow1Dev/ow1dev.nvim";
  };

  outputs = {flake-parts, ...} @ inputs: let
    linuxArch = "x86_64-linux";
    stateVersion = "24.11";
    libx = import ./lib {inherit inputs stateVersion;};

    hosts = {
      nestop = {
        hostname = "nestop";
        username = "ow1";
        platform = linuxArch;
      };
    };
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        linuxArch
      ];

      flake = {
        nixosConfigurations = {
          ${hosts.nestop.hostname} = libx.mkHost hosts.nestop;
        };

        homeConfigurations = {
          "${hosts.nestop.username}@${hosts.nestop.hostname}" = libx.mkHome hosts.nestop;
        };
      };
      perSystem = {pkgs, ...}: let
        inherit (pkgs) alejandra just mkShell;
      in {
        devShells = {
          default = mkShell {
            nativeBuildInputs = [just];
          };
        };

        formatter = alejandra;
      };
    };
}
