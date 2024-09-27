{inputs, ...}: {
  imports = [
    inputs.stylix.homeManagerModules.stylix
    ../../modules/stylix

    ./ags
    ./neovim
    ./hyprland
    ./hyprlock
    ./gtk
    ./direnv
    ./waybar
    ./rofi
    ./fuzzel
    ./swaync
    ./foot
    ./kitty
    ./tmux
    ./chrome
    ./zsh
    ./git
    ./zoxide
  ];
}
