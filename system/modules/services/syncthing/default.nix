{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.module.services.syncthing;
in {
  options = {
    module.services.syncthing.enable = mkEnableOption "Enable syncthing";
  };

  config = mkIf cfg.enable {
    services.syncthing = {
      enable = true;
      user = "ow1";
      dataDir = "/home/ow1/.obsidian/obsidian";
      configDir = "/home/ow1/.config/syncthing";
    };
  };
}
