{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.module.hyprland;
in {
  imports = [
    ./binds
  ];

  options = {
    module.hyprland.enable = mkEnableOption "Enable Hyprland";
  };

  config = mkIf cfg.enable {
    module.hyprland = {
      binds.enable = mkDefault cfg.enable;
    };

    home.packages = with pkgs; [
      wl-clipboard
      wf-recorder
      hyprpicker
      waypaper
      cliphist
      gtk3
      dbus
      glib
      libinput
      xdg-utils
      pavucontrol
      networkmanagerapplet
      brightnessctl
    ];

    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;

      systemd = {
        enable = true;
        extraCommands = lib.mkBefore [
          "systemctl --user stop graphical-session.target"
          "systemctl --user start hyprland-session.target"
        ];
      };

      settings = {
        env = [
          "XDG_CURRENT_DESKTOP,Hyprland"
          "XDG_SESSION_DESKTOP,Hyprland"
          "IBVA_DRIVER_NAME,nvidia"
          "DG_SESSION_TYPE,wayland"
          "BM_BACKEND,nvidia-drm"
          "_GLX_VENDOR_LIBRARY_NAME,nvidia"
        ];

        animations = {
          enabled = true;
          bezier = ["md3_decel, 0.05, 0.7, 0.1, 1" "workspace,0.17, 1.17, 0.3,1"];

          animation = [
            "border, 1, 2, default"
            "fade, 1, 2, md3_decel"
            "windows, 1, 4, md3_decel, popin 60%"
            "workspaces, 1, 5, workspace, slidefadevert 8%"
          ];
        };

        xwayland = {
          force_zero_scaling = "true";
        };

        gestures = {
          workspace_swipe = true;
          workspace_swipe_fingers = 3;
        };

        decoration = {
          rounding = 3;

          active_opacity = 1.0;
          inactive_opacity = 1.0;
          fullscreen_opacity = 1.0;

          drop_shadow = false;

          blur = {
            enabled = true;
            passes = 3;
            size = 16;
          };
        };

        master = {
          new_status="master";
        };

        general = {
          gaps_in = 3;
          gaps_out = 7;
          border_size = 3;
          layout = "master";
        };

        input = {
          kb_layout = "us,dk";
          kb_options = "grp:caps_toggle";
          accel_profile = "flat";
          sensitivity = 0.0;

          touchpad = {
            natural_scroll = true;
          };
        };

        cursor = {
            no_hardware_cursors = true;
        };

        misc = {
          disable_autoreload = false;
          disable_hyprland_logo = true;
          focus_on_activate = false;
          force_default_wallpaper = 0;
        };
      };
    };
  };
}
