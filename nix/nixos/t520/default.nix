{ pkgs, lib, ... }: {

  system.stateVersion = "17.03";

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;
  # boot.kernel.sysctl."kernel.yama.ptrace_scope" = lib.mkDefault "0";

  time.timeZone = "America/Chicago";
  security.sudo.wheelNeedsPassword = false;

  imports = [
    ./net.nix
    ./media.nix
    ./config.nix
    ./tpkgs.nix
    ./gpkgs.nix
    # ./l33t
    # ./xfce
    ./gnome
    # ./kde
  ];

  users.extraUsers = {
    nick = {
      isNormalUser = true;
      uid = 1000;
      extraGroups = [ "wheel" ];
    };
    guest = {
      isNormalUser = true;
      uid = 1001;
    };
    other = {
      isNormalUser = true;
      uid = 1002;
      extraGroups = [ "wheel" ];
    };
  };

  services.xserver = {
    enable = true;
    autorun = true;
    layout = "us";
  };
  
  fonts = {
    enableFontDir = true;
    fontconfig.enable = true;
    fonts = [
      pkgs.dejavu_fonts
      pkgs.font-awesome-ttf
    ];
  };

  environment.systemPackages = with pkgs; [
    xclip
    xorg.xkill
    xorg.xwininfo
    xlibs.xmodmap
    xlibs.xmessage
    xlibs.xev
    dejavu_fonts
  ];

}