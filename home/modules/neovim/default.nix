{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:
with lib; let
  cfg = config.module.nvim;
in {
  options = {
    module.nvim.enable = mkEnableOption "Enables nvim";
  };

  config = mkIf cfg.enable {
    home.packages = [
      inputs.ow1dev-nvim.packages.${pkgs.system}.neovim
    ];
  };
}
