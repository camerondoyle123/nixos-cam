{ pkgs }:

let
    image = ./sddm-login-image.jpg;
in
pkgs.stdenv.mkDerivation {
   name = "tokyo-night-sddm";
   version = "1.0";
   dontBuild = true;
   src = pkgs.fetchFromGitHub {
     owner = "siddrs";
     repo = "tokyo-night-sddm";
     rev = "320c8e74ade1e94f640708eee0b9a75a395697c6";
     sha256 = "sha256-JRVVzyefqR2L3UrEK2iWyhUKfPMUNUnfRZmwdz05wL0=";
   };
 
   installPhase = ''
      mkdir -p $out
      cp -R ./* $out/
   '';
 
 }

