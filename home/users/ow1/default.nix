{pkgs, ...}: {
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
    waybar.enable = true;
    ags.enable = false;
    gtk.enable = true;
    rofi.enable = false;
    fuzzel.enable = true;
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
      nnn

      # DevOps Utils
      docker-compose

      # Developer tools
      doppler
      httpie
    ];
  };
}
