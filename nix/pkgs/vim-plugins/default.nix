{ lib, callPackage, stdenv, fetchgit }:

let

  extra = callPackage ./extra.nix {};

  mkDrv = { name, src }: stdenv.mkDerivation ({
    inherit name src;
    builder = builtins.toFile "builder.sh" ''
      . $stdenv/setup
      d=$out/share/vim-bundle
      mkdir -p $d
      root=$d/${name}
      cp -r $src src
      chmod -R u+w -- src
      pushd src
        eval "$extra"
      popd
      cp -r src $root
    '';
  } // (if lib.hasAttr name extra then lib.getAttr name extra else {}));

  mk = lib.mapAttrs (name: value: mkDrv {
    inherit name;
    src = value;
  });

  attrs = mk (import ./srcs.nix {
    inherit fetchgit;
  });

in {
  inherit attrs;
  all = lib.attrValues attrs;
  includeNames = map (k: lib.getAttr k attrs);
  excludeNames = names: lib.filterAttrs (k: v: !(lib.elem k names)) attrs;
}
