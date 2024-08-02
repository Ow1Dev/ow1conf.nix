{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.module.fuzzel;
in {
  options = {
    module.fuzzel.enable = mkEnableOption "Enables fuzzel";
  };

  config = mkIf cfg.enable {
    programs.fuzzel = {
      enable = true;
      settings = {
        main = {
          line-height = 25;
          fields = "name,generic,comment,categories,filename,keywords";
          terminal = "foot";
          prompt = "' ➜  '";
          icon-theme = "Papirus-Dark";
          layer = "top";
          lines = 10;
          width = 35;
          horizontal-pad = 25;
          inner-pad = 5;
        };
        border = {
          radius = 15;
          width = 3;
        };
      };
    };
  };
}
