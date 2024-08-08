{
  pkgs,
  config,
  ...
}: {
  imports = [
    ../../../modules/nix
    ../../modules
  ];

  nixpkgs.overlays = [
    (import ../../overlays/rofi-calc.nix)
    (import ../../overlays/rofi-emoji.nix)
  ];

  module = {
    nvim.enable = true;
    git.enable = true;
    zsh.enable = true;
    hyprland.enable = true;

    hyprlock.enable = config.module.hyprland.enable;
    waybar.enable = config.module.hyprland.enable;
    fuzzel.enable = config.module.hyprland.enable;

    ags.enable = false;
    gtk.enable = true;
    rofi.enable = false;
    foot.enable = true;
    chrome.enable = true;
    swaync.enable = true;
    zoxide.enable = true;
    nix-config = {
      enable = true;
      useNixPackageManagerConfig = false;
    };
  };

  home = {
    # Software
    packages = with pkgs; [
      # Utils
      bat
      jq
      gh
      nnn

      # DevOps Utils
      docker-compose

      # Developer tools
      doppler
      httpie
    ];
  };
}
