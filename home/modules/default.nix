{inputs, ...}: {
  imports = [
    inputs.stylix.homeManagerModules.stylix
    ../../modules/stylix

    ./ags
    ./neovim
    ./hyprland
    ./gtk
    ./waybar
    ./rofi
    ./fuzzel
    ./foot
    ./chrome
    ./zsh
    ./git
    ./zoxide
  ];
}
