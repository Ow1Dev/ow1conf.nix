{inputs, ...}: {
  imports = [
    inputs.stylix.homeManagerModules.stylix
    ../../modules/stylix

    ./ags
    ./neovim
    ./hyprland
    ./hyprlock
    ./gtk
    ./waybar
    ./rofi
    ./fuzzel
    ./swaync
    ./foot
    ./kitty
    ./chrome
    ./zsh
    ./git
    ./zoxide
  ];
}
