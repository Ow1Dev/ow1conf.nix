{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.module.kitty;
in {
  options = {
    module.kitty.enable = mkEnableOption "Enables kitty";
  };

  config = mkIf cfg.enable {
    programs.kitty = {
      enable = true;
      settings = {
        confirm_os_window_close = 0;
        window_padding_width = "10.0";

        # OS Window titlebar colors
        wayland_titlebar_color = "system";
        macos_titlebar_color = "system";
      };
    };
  };
}
