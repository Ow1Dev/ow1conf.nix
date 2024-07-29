{pkgs, ...}: {
  imports = [
    ../../../modules/nix
    ../../modules
  ];

  module = {
    nvim.enable = true;
    git.enable = true;
    zsh.enable = true;
    hyprland.enable = true;
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
