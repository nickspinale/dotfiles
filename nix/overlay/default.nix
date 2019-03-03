self: super: with self; {

  lib = super.lib // import ./lib { inherit (super) lib; };

  inherit (callPackage ./vim-plugins {}) vim-plugins vim-plugins-all vim-plugins-excluding;
  inherit (callPackage ./dotfiles {}) mkDotfiles mkDotfilesIn update-dotfile-links;

  my-vim = callPackage ./pkgs/vim {
    inherit (darwin.apple_sdk.frameworks) CoreServices Cocoa Foundation CoreData;
    inherit (darwin) libobjc cf-private;
  };

  my-vim-gui = callPackage ./pkgs/vim {
    inherit (darwin.apple_sdk.frameworks) CoreServices Cocoa Foundation CoreData;
    inherit (darwin) libobjc cf-private;
    guiSupport = "auto";
  };

  uttyl = callPackage ./pkgs/uttyl {};
  fznode = callPackage ./pkgs/fznode {};
  readme-preview = callPackage ./pkgs/grip {};
  chicago95-theme = callPackage ./pkgs/chicago95-theme {};
  sddm-theme-abstractdark = callPackage ./pkgs/sddm-themes/abstractdark.nix {};

}
