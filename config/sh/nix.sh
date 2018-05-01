alias nb='nix-build "<nixpkgs>" -A'
alias nev='nix-env -f "<nixpkgs>" -iA'
alias nevd='nix-env -f "<nixpkgs>" -iA darwin-env'
alias cabaldef='cabal2nix . > default.nix'
alias cabalsh='cp ~/dotfiles/store/shell.nix .'
alias snrs='sudo nixos-rebuild switch'

function nixtest() {
    f="$1"
    shift
    nix-build -E "(import <nixpkgs> {}).callPackage ./$f {}" "$@"
}

function nixhest() {
    nix-build -E "(import <nixpkgs> {}).haskellPackages.callPackage ./$1 {}"
}

function nixshh() {
    nix-shell -E '((import <nixpkgs> {}).haskellPackages.callPackage ./. {}).env'
}

function nder() {
    echo $NIX_PATH | sed -rn 's/^.*nixpkgs=([^:]+):.*$/\1/p'
}

function nde() {
    efd $(nder)
}
