{
  pkgs,
  config,
  isWsl,
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
    stylix.enable = !isWsl;
    hyprland.enable = !isWsl;

    hyprlock.enable = config.module.hyprland.enable;
    waybar.enable = config.module.hyprland.enable;
    fuzzel.enable = config.module.hyprland.enable;

    gtk.enable = !isWsl;
    rofi.enable = !isWsl;
    foot.enable = false;
    kitty.enable = !isWsl;
    chrome.enable = !isWsl;
    swaync.enable = !isWsl;
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
    ] ++ lib.optionals (!isWsl) [
      # Misc
      spotify
      discord
    ];
  };
}
