{ pkgs, lib, ... }: {

  imports = [
    ./base.nix
    ./pkgs.nix
    ./xmonad.nix
  ];

}
