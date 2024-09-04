# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      # these can collide if you use symlinks!
      # I've provided the absolute path so I don't get confused again.
      /etc/nixos/hardware-configuration.nix
      ./pkgs
    ];
  
  # for managing the login screen
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.theme = "${import ./pkgs/sddm-theme.nix { inherit pkgs; }}";

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;
  networking.nameservers = [
    "1.1.1.1"
    "8.8.8.8"
  ];
  networking.firewall.allowedTCPPorts = [ 80 443 ];
  # auto-resolve DNS so you can actually use the god damn internet 
  services.resolved.enable = true;

  # Set your time zone.
  time.timeZone = "Australia/Melbourne";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_AU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  # configure X11
  services.xserver = {
    enable = true;
    
    desktopManager = {
      gnome.enable = true;
      xterm.enable = false;
      #cinnamon.enable = true;
    };

    xkb = {
      layout = "au";
      variant = "";
    };

  };



  # Enable the GNOME Desktop Environment.
  #services.xserver.displayManager.gdm.enable = true; # remember, you set one way above with sddm!

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.cameron = {
    isNormalUser = true;
    description = "Cameron";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # for everyone on the system
  users.defaultUserShell = pkgs.zsh;

  # Install firefox.
  programs.firefox.enable = true;
  programs.zsh.enable = true;

  # Help with non-Nix binaries for Neovim.
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    lua-language-server
    ruff
  ];


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    arc-theme
    clang
    clojure
    firefox
    git
    gtk3
    home-manager
    jump
    lf
    libsForQt5.breeze-icons
    libsForQt5.konsole
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtsvg
    libsForQt5.qt5.wrapQtAppsHook
    lua
    mypackages.sddm-theme
    neovim
    nix-prefetch-git
    nixd
    nodejs_22
    pstree
    ripgrep
    unzip
    themechanger
    vim 
  ];

  # for the fonts
  fonts.packages = with pkgs; [ 
    jetbrains-mono 
    terminus-nerdfont 
    font-awesome 
    inconsolata-nerdfont
    ];

  # changing the system editor
    programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
