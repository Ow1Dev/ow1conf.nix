{inputs, ...}: {
  imports = [
    inputs.stylix.homeManagerModules.stylix
    ../../modules/stylix

    ./neovim
    ./zsh
    ./git
    ./zoxide
  ];
}
