{ pkgs }:

let
    image = ./sddm-login-image.png;
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
   # as you can see, I am mad.
   # it's difficult to declaratively change the default image from the options
   # in the tokyo-night package, so I just nuke the default and choose the one
   # I want and name it the same as the default!
   installPhase = ''
      mkdir -p $out
      cp -R ./* $out/
      cd $out/Backgrounds
      rm win11.png
      cp -r $out/Backgrounds/shacks.png $out/Backgrounds/win11.png
   '';
 
 }

