{ mkDerivation, base, containers, stdenv, xmonad, xmonad-contrib }:
mkDerivation {
  pname = "xmonad-config";
  version = "0.1.0.0";
  src = ./.;
  libraryHaskellDepends = [ base containers xmonad xmonad-contrib ];
  license = stdenv.lib.licenses.mit;
}