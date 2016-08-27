{ pkgs, ... }:

{
  imports = [
    ../modules/anywm.nix
  ];

  fonts = {
    enableFontDir = true;
    fontconfig.enable = true;
    fonts = [
      pkgs.dejavu_fonts
    ];
  };

  services.xserver = {

    autorun = true;
    enable = true;
    layout = "us";

    windowManager.anywm =
      let my-xmonad = pkgs.haskellPackages.callPackage <dotfig/xmonad> {};
      in {
        enable = true;
        start = ''
          source $HOME/dotfiles/config/sh/env.sh
          logdir=$HOME/log/anywm
          mkdir -p $logdir
          ${my-xmonad}/bin/xmonad > $logdir/out.log 2> $logdir/err.log &
          waitPID=$!
        '';
      };

    displayManager = {
      sessionCommands = ''
        xrdb -merge ${<dotfig/nix/nixos/x11/xresources>}
        xmodmap ${<dotfig/nix/nixos/x11/Xmodmap>}
        xset r rate 300 50
        feh --bg-max ~/.background.jpg
        # for img in ~./background.{png,jpg}; do
        #     feh --bg-max "$img"
        # done
        # xsetroot -solid '#002B36'
      '';
      slim.enable = true;
      slim.defaultUser = "nick";
      slim.theme = pkgs.fetchurl {
          url = "https://github.com/jagajaga/nixos-slim-theme/archive/Final.tar.gz";
          sha256 = "4cab5987a7f1ad3cc463780d9f1ee3fbf43603105e6a6e538e4c2147bde3ee6b";
      };
    };

    desktopManager.xterm.enable = false;

    # desktopManager.kde4.enable = true;
    # displayManager.kdm.enable = true;

  };
}
