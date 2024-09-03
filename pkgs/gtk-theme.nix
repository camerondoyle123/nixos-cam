{ pkgs }:


pkgs.stdenv.mkDerivation {
   name = "arc-theme";
   dontBuild = true;
   src = pkgs.fetchFromGitHub {
     owner = "horst3180";
     repo = "arc-theme";
     rev = "8290cb813f157a22e64ae58ac3dfb5983b0416e6";
     sha256 = "sha256-zv9kH+OErD6tUr3ZF6UA4s9dmDhFTwf078LYhGPhsdM=";
   };

   installPhase = ''
      mkdir -p $out
      cp -R ./* $out/
   '';
 
 }

