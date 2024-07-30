{inputs, ...}: {
  imports = [
    inputs.stylix.homeManagerModules.stylix
    ../../modules/stylix

    ./neovim
    ./hyprland
    ./waybar
    ./rofi
    ./foot
    ./chrome
    ./zsh
    ./git
    ./zoxide
  ];
}
