pkgs: with pkgs; [

# nix
nix-repl
nix-prefetch-scripts

# convenience
rlwrap

# general
coreutils
gnumake
which
zip
unzip

# x utils
xclip
xorg.xkill
xlibs.xmodmap
xlibs.xmessage
haskellPackages.xmobar
dmenu
gmrun

# x applications
firefox
# google-chrome

# fonts
dejavu_fonts

# dev
tmux
git
mercurial
subversion
fzf
vimHugeX
(vim-rtp "annoying.rtp" [ ycm ])

gcc
python27
python34

# wicd

wpa_supplicant
wpa_supplicant_gui
wirelesstools
iw
# networkmanager
# networkmanagerapplet

feh
bind
telnet
xorg.xwininfo
rxvt_unicode
]