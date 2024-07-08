{pkgs, ...}: {
  imports = [
    ../../../modules/nix
    ../../modules
  ];

  module = {
    nvim.enable = true;
    git.enable = true;
    nix-config = {
      enable = true;
      useNixPackageManagerConfig = false;
    };
  };

  home = {
    # Software
    packages = with pkgs; [
      bat
    ];
  };
}

