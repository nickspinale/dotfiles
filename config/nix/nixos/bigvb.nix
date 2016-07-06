{ pkgs, ... }:

{
  imports = [
    ./common.nix
  ];

  environment.systemPackages = pkgs.mylib.gatherLists pkgs [
    ./lists/core.nix
    ./lists/huge.nix
    ./lists/current.nix
  ];

  boot.loader.grub.device = "/dev/sda";
}
