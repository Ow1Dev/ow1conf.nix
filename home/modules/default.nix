{inputs, ...}: {
  imports = [
    inputs.stylix.homeManagerModules.stylix
    ../../modules/stylix

    ./neovim
    ./hyprland
    ./foot
    ./chrome
    ./zsh
    ./git
    ./zoxide
  ];
}
