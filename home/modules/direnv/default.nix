{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.module.direnv;
in {
  options = {
    module.direnv.enable = mkEnableOption "Enables direnv";
  };

  config = mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      enableZshIntegration = config.module.zsh.enable;
      nix-direnv.enable = true;
    };
  };
}
