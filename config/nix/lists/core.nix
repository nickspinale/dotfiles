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

]