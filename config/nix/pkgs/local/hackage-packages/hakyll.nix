{ mkDerivation, base, binary, blaze-html, blaze-markup, bytestring
, containers, cryptohash, data-default, deepseq, directory
, filepath, fsnotify, http-conduit, http-types, lrucache, mtl
, network, network-uri, optparse-applicative, pandoc
, pandoc-citeproc, parsec, process, QuickCheck, random, regex-base
, regex-tdfa, resourcet, scientific, stdenv, system-filepath
, tagsoup, tasty, tasty-hunit, tasty-quickcheck, text, time
, time-locale-compat, unordered-containers, utillinux, vector, wai
, wai-app-static, warp, yaml
}:
mkDerivation {
  pname = "hakyll";
  version = "4.9.0.0";
  sha256 = "0pi96xij3h8kid056kcdkpg8m0ib5q9g2265myhnc0gkz9z6j8bc";
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    base binary blaze-html blaze-markup bytestring containers
    cryptohash data-default deepseq directory filepath fsnotify
    http-conduit http-types lrucache mtl network network-uri
    optparse-applicative pandoc pandoc-citeproc parsec process random
    regex-base regex-tdfa resourcet scientific system-filepath tagsoup
    text time time-locale-compat unordered-containers vector wai
    wai-app-static warp yaml
  ];
  executableHaskellDepends = [ base directory filepath ];
  testHaskellDepends = [
    base binary blaze-html blaze-markup bytestring containers
    cryptohash data-default deepseq directory filepath fsnotify
    http-conduit http-types lrucache mtl network network-uri
    optparse-applicative pandoc pandoc-citeproc parsec process
    QuickCheck random regex-base regex-tdfa resourcet scientific
    system-filepath tagsoup tasty tasty-hunit tasty-quickcheck text
    time time-locale-compat unordered-containers vector wai
    wai-app-static warp yaml
  ];
  testToolDepends = [ utillinux ];
  homepage = "http://jaspervdj.be/hakyll";
  description = "A static website compiler library";
  license = stdenv.lib.licenses.bsd3;
}