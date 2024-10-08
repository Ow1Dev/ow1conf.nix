{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.module.foot;
in {
  options = {
    module.foot.enable = mkEnableOption "Enables Foot";
  };

  config = mkIf cfg.enable {
    programs.foot = {
      enable = true;
      server.enable = true;

      settings = {
        main = {
          term = "xterm-256color";
          workers = 32;
          initial-window-size-chars = "115x24";
          pad = "0x4";
        };

        mouse = {
          hide-when-typing = "no";
        };
      };
    };
  };
}
