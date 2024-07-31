{ config
, lib
, pkgs
, ...
}:

with lib;

let
  cfg = config.module.hyprland.binds;

  audioControl      = "${pkgs.pulseaudio}/bin/pactl";
  brightnessControl = "${pkgs.brightnessctl}/bin/brightnessctl";
  appLauncher       = "rofi -show";
in {
  options = {
    module.hyprland.binds.enable = mkEnableOption "Enables binds in Hyprland";
  };

  config = mkIf cfg.enable {
    wayland.windowManager.hyprland.settings = {
      exec-once = [
        "ags -b hypr"
      ];

      bind = [
        # Workspaces
        "SUPER, 1, workspace, 1"
        "SUPERSHIFT, 1, movetoworkspacesilent, 1"
        "SUPER, 2, workspace, 2"
        "SUPERSHIFT, 2, movetoworkspacesilent, 2"
        "SUPER, 3, workspace, 3"
        "SUPERSHIFT, 3, movetoworkspacesilent, 3"
        "SUPER, 4, workspace, 4"
        "SUPERSHIFT, 4, movetoworkspacesilent, 4"
        "SUPER, 5, workspace, 5"
        "SUPERSHIFT, 5, movetoworkspacesilent, 5"
        "SUPER, 6, workspace, 6"
        "SUPERSHIFT, 6, movetoworkspacesilent, 6"
        "SUPER, 7, workspace, 7"
        "SUPERSHIFT, 7, movetoworkspacesilent, 7"
        "SUPER, 8, workspace, 8"
        "SUPERSHIFT, 8, movetoworkspacesilent, 8"
        "SUPER, 9, workspace, 9"
        "SUPERSHIFT, 9, movetoworkspacesilent, 9"
        "SUPER, 0, workspace, 10"
        "SUPERSHIFT, 0, movetoworkspacesilent, 10"
        "SUPER, minus, workspace, 11"
        "SUPERSHIFT, minus, movetoworkspacesilent, 11"
        "SUPER, equal, workspace, 12"
        "SUPERSHIFT, equal, movetoworkspacesilent, 12"

        # Compositor commands
        "SUPER, Q, killactive"
        "SUPER, F, fullscreen, 1"
        "SUPER, Space, togglefloating"

        # Grouped (tabbed) windows
        "SUPER, G, togglegroup"
        "SUPER, TAB, changegroupactive, f"
        "SUPERSHIFT, TAB, changegroupactive, b"

        # Move focus
        "SUPER, j, layoutmsg, cyclenext"
        "SUPER, k, layoutmsg, cycleprev"

        # Move windows
        "SUPERSHIFT, j, layoutmsg, swapnext"
        "SUPERSHIFT, k, layoutmsg, swapprev"

        # Cycle through workspaces
        "SUPERALT, up, workspace, m-1"
        "SUPERALT, down, workspace, m+1"

        # Brightness
        ",XF86MonBrightnessDown, exec, ${brightnessControl} set 5%-"
        ",XF86MonBrightnessUp, exec,   ${brightnessControl} set +5%"

        # Audio
        ", xf86audioraisevolume, exec, ${audioControl} set-sink-volume @DEFAULT_SINK@ +5%"
        ", xf86audiolowervolume, exec, ${audioControl} set-sink-volume @DEFAULT_SINK@ -5%"
        ", xf86audiomute,        exec, ${audioControl} set-sink-mute @DEFAULT_SINK@ toggle"

        # Terminal
        # "SUPER, Return, exec, ${pkgs.alacritty}/bin/alacritty"
        "SUPER, Return, exec, ${pkgs.foot}/bin/foot"

        # Launchers
        "CTRL, Space, exec, ${appLauncher}"

        # Cliphist
        # "SUPER, C, exec, ${cliphist}"

        # Lock
        # "SUPER, L, exec, ${pkgs.hyprlock}/bin/hyprlock"

        # Fullscreen
        "SUPER, Z, fullscreen"
      ];

      binde = [
        # Audio
        "SUPER ,V , exec,     ${audioControl} set-sink-volume @DEFAULT_SINK@ +5%"
        "SUPERSHIFT ,V, exec, ${audioControl} set-sink-volume @DEFAULT_SINK@ -5%"
        "SUPER ,M , exec,     ${audioControl} set-sink-mute @DEFAULT_SINK@ toggle"
      ];

      # Mouse bindings
      bindm = ["SUPER, mouse:272, movewindow" "SUPER, mouse:273, resizewindow"];

      # layer rules
      layerrule = let
        toRegex = list: let
          elements = lib.concatStringsSep "|" list;
        in "^(${elements})$";

        layers = [
          "gtk-layer-shell"
          "swaync-control-center"
          "swaync-notification-window"
          "waybar"
        ];
      in ["blur, ${toRegex layers}" "ignorealpha 0.5, ${toRegex layers}"];

      # Window rules
      windowrulev2 = [
        # Xdg
        "float, class:^(xdg-desktop-portal-gtk)$"
        "size 900 500, class:^(xdg-desktop-portal-gtk)$"
        "dimaround, class:^(xdg-desktop-portal-gtk)$"
      ];
    };
  };
}

