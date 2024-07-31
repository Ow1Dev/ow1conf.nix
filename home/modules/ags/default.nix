{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:
with lib; let
  cfg = config.module.ags;
in {
  imports = [inputs.ags.homeManagerModules.default];

  options = {
    module.ags.enable = mkEnableOption "Enables ags";
  };

  config = mkIf cfg.enable {
    programs.ags = {
      enable = true;

      configDir = ./.;

      extraPackages = with pkgs; [
        bun
      ];
    };

    home.packages = with pkgs; [
      bun
    ];
  };
}
