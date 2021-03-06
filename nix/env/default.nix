pkgs: with pkgs; [

  my-vim tmux git fzf fd
  file rlwrap
  fznode

  curl wget
  diffutils
  gawk gnupatch gnutar xz less procps

  bashInteractive

  coreutils findutils
  gnused gnugrep
  which file

  gdb screen
  gnumake
  mercurial subversion
  zip unzip
  rsync

  openssl telnet
  gnupg

  readme-preview
  ripgrep jq

  nix-prefetch-scripts
  patchelf
  rlwrap

  update-dotfile-links
  (mkDotfilesIn "${lib.nixPathAttrs.dotfiles}/config" {
    ".bash_profile"          = "bash/bash_profile.${if hostPlatform.isDarwin then "macos" else "linox"}";
    ".bashrc"                = "bash/bashrc";
    ".tmux.conf"             = "multiplexers/tmux.conf";
    ".vimrc"                 = "vim/vimrc";
    ".config/git/config"     = "git/config";
    ".config/git/ignore"     = "git/ignore";
    ".ghci"                  = "interpreters/ghci";
    ".editrc"                = "line-editors/editrc";
    ".haskeline"             = "line-editors/haskeline";
    ".inputrc"               = "line-editors/inputrc";
  })

] ++ lib.optionals hostPlatform.isDarwin [

  reattach-to-user-namespace

] ++ lib.optionals hostPlatform.isLinux [

] ++ vim-plugins-all
