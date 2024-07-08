{ inputs
, lib
, config
, pkgs
, ...
}:

with lib;

let
  cfg = config.module.nix-config;
  inherit (pkgs.stdenv) isLinux;
in {
  options = {
    module.nix-config = {
      enable = mkEnableOption "Enables nix-config";

      useNixPackageManagerConfig = mkOption {
        type = types.bool;
        description = "Whether to use custom Nix package manager settings.";
        default = true;
      };
    };
  };

  config = mkIf cfg.enable {
    # Nixpkgs config
    nixpkgs.config = {
      allowUnfree = true;
    };

    # Nix package manager settings
    nix = optionalAttrs cfg.useNixPackageManagerConfig ({
      registry.s.flake = inputs.self;

      settings = {
        experimental-features = [ "nix-command" "flakes" ];
        auto-optimise-store = true;
      };

      gc = {
        automatic = true;
        options = "--delete-older-than 14d";
      };
    } // optionalAttrs isLinux {
      gc.dates = "daily";
      optimise.automatic = true;
    });
  };
}

