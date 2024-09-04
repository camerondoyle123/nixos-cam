#!/usr/bin/bash

# if you haven't made a backup for configuration.nix, then do so
if [ ! -f /etc/nixos/configuration-legacy.nix ]; then
    echo "Legacy configuration.nix file not found, creating...";
    mv /etc/nixos/configuration.nix /etc/nixos/configuration-legacy.nix;
fi
# link the config file
ln -sf /home/cameron/GitHub/nixos-cam/configuration.nix /etc/nixos/configuration.nix;

# for the hardware-configuration.nix, also make a backup
if [ ! -f /etc/nixos/hardware-configuration-legacy.nix ]; then
    echo "Legacy hardware-configuration.nix file not found, creating...";
    mv /etc/nixos/hardware-configuration.nix /etc/nixos/hardware-configuration-legacy.nix;
fi


# create the home-manager directory if it doesn't exist already
mkdir -p /home/cameron/.config/home-manager;
ln -sf /home/cameron/GitHub/nixos-cam/home.nix /home/cameron/.config/home-manager/home.nix;

# need this for neovim to work with packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim;
