{inputs, ...}: {
  imports = [
    ../../modules
    inputs.nixos-wsl.nixosModules.default
  ];

  wsl.enable = true;
  wsl.defaultUser = "ow1";

  module = {
    locales.enable = true;
    network.enable = true;
    security.enable = true;
    users.enable = true;
    programs.systemPackages.enable = true;
    virtualisation.enable = true;

    programs = {
      hm.enable = true;
      zsh.enable = true;
    };
  };
}
