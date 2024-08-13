{
  description = "ow1 flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    # NixOS community
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
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
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Just for pretty flake.nix
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    # My neovim config
    ow1dev-nvim.url = "github:Ow1Dev/ow1dev.nvim";
  };

  outputs = {
    flake-parts,
    self,
    ...
  } @ inputs: let
    linuxArch = "x86_64-linux";
    stateVersion = "24.05";
    libx = import ./lib {inherit inputs stateVersion;};

    hosts = {
      nestop = {
        hostname = "nestop";
        username = "ow1";
        platform = linuxArch;
      };
      wsl = {
        hostname = "wsl";
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
          ${hosts.wsl.hostname} = libx.mkHost hosts.wsl;
        };

        homeConfigurations = {
          "${hosts.nestop.username}@${hosts.nestop.hostname}" = libx.mkHome hosts.nestop;
          "${hosts.wsl.username}@${hosts.wsl.hostname}" = libx.mkHome hosts.wsl;
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
