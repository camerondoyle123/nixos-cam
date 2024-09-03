{pkgs, ...}: let
  callPackage = pkgs.callPackage;
in {
  nixpkgs.overlays = [(final: prev: {
    mypackages = {
      sddm-theme = callPackage ./sddm-theme.nix {};
      gtk-theme = callPackage ./gtk-theme.nix {};
    };
  })];
}

