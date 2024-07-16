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
    programs.neovim = inputs.ow1dev-nvim.lib.mkHomeManager {
      system = pkgs.system;
    };
  };
}
