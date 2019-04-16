set -e

. ./vars-nixos.sh

profile=/nix/var/nix/profiles/system
cfg=$(nix-build '<top>' -A build.toplevel --no-out-link)
if [ $? != 0 ]; then
    return $?
fi
echo "TOPLEVEL: $cfg"
echo "linking profile"
sudo nix-env -p $profile --set $cfg
echo "switching to configuration"
sudo $cfg/bin/switch-to-configuration switch

export NIX_PROFILES="$HOME/.nix-profile /nix/var/nix/profiles/default /run/current-system/sw"

update-dotfile-links
