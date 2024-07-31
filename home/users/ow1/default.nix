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
    waybar.enable = false;
    ags.enable = true;
    gtk.enable = true;
    rofi.enable = true;
    foot.enable = true;
    chrome.enable = true;
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
