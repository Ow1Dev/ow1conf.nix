{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.module.git;
in {
  options = {
    module.git.enable = mkEnableOption "Enables git";
  };

  config = mkIf cfg.enable {
    # Git config
    programs.git = {
      enable = true;
      userName = "Ow1Dev";
      userEmail = "31339803+Ow1Dev@users.noreply.github.com";
    };
  };
}
