_default:
    just --list

home-switch profile:
  home-manager switch --flake .#{{ profile }}
