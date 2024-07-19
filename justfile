_default:
    just --list

check:
    nix flake check

home-switch profile:
  home-manager switch --flake .#{{ profile }}

update:
    nix flake update
