{ pkgs, ... }:

{

  nixpkgs.config = import <dotfig/nix/pkgs/config.nix>;

  networking.hostName = "nixos";
  networking.hostId = "c890f48c";

  time.timeZone = "America/New_York";

  users.extraUsers.nick = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  security.sudo = {
    wheelNeedsPassword = false;
    extraConfig = ''
      Defaults env_keep += "NIX_PATH"
    '';
  };

  services.openssh.enable = true;

}