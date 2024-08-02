{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.module.swaync;
in {
  options = {
    module.swaync.enable = mkEnableOption "Enables swaync";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [swaynotificationcenter];
    xdg.configFile."swaync/style.css".source = ./style.css;
    xdg.configFile."swaync/config.json".source = ./config.json;
  };
}
