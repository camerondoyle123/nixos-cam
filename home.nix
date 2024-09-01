{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "cameron";
  home.homeDirectory = "/home/cameron";

  # Packages that should be installed to the user profile.
  home.packages = [
    pkgs.htop
    pkgs.fortune
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Set nicer cursors.
  home.pointerCursor = {
    name = "phinger-cursors-dark";
    package = pkgs.phinger-cursors;
    size = 32;
    gtk.enable = true;
  };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;


  programs.zsh = { 
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  
    shellAliases = {
      ll = "ls -l";
    };
  
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  
    # plugin management
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "jump" ];
      theme = "robbyrussell";
    };

    };


}
