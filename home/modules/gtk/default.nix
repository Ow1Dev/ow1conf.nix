{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.module.nvim;
in {
  options = {
    module.gtk.enable = mkEnableOption "Enables gtk";
  };

  config = mkIf cfg.enable {
    gtk = {
      enable = true;
      iconTheme = {
        package = pkgs.catppuccin-papirus-folders.override {
          flavor = "frappe";
          accent = "blue";
        };
        name = "Papirus-Dark";
      };
    };
  };
}
