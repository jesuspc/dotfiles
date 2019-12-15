# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./dropbox.nix
    ];

  nixpkgs.config.allowUnfree = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices = [
    {
      name = "root";
      device = "/dev/disk/by-uuid/18ba0426-a74c-4bcf-a0fe-f6fac3e3f27c";
      preLVM = true;
    }
  ];

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;
  networking.extraHosts = "52.211.43.113 gridshare.moixa-data.com";
  networking.firewall.allowedTCPPorts = [ 3000 3001 3002 3003 3004 3005 3006 3007 3008 3009 3389 4444 9200 9300 5000 5001 5601 5900 5901 5902 5903 5904 8000 8888 9000 9229 19000 19001 19002 19003 ];
  networking.interfaces.eno1.ipv4.addresses = [ { address = "192.168.99.10"; prefixLength = 24; }];
  networking.hosts = {
    "127.0.0.1" = ["localhost" "local-dev.moixa-data.com" "maslow-ui.local-dev.moixa-data.com"];
    "192.168.99.20" = ["mac"];
  };

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  time.timeZone = "UTC";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.pathsToLink = [ "/include" ];
  environment.systemPackages = with pkgs; [
    wget
    tk
    gitAndTools.gitFull
    openssl
    tmux
    xclip
    xsel

    unzip

    ncurses

    htop
    ncdu

    keychain

    fasd
    ag
    # ripgrep
    aspell

    jq

    networkmanager
    google-chrome
    chromium

    bash
    oh-my-zsh
    terminator

    docker
    docker_compose

    gnumake
    aspellDicts.en

    awscli
    terraform
    marathon

    ghc
    gcc

    # Ruby
    ruby
    bundler
    rake
    # JS
    nodejs-12_x
    python36

    vim
    ((emacsPackagesNgGen emacs).emacsWithPackages (epkgs: [
	epkgs.emacs-libvterm
    ]))
    # Emacs haskell mode dependencies
    haskellPackages.apply-refact
    haskellPackages.hlint
    haskellPackages.stylish-haskell
   # haskellPackages.hasktags
    haskellPackages.hoogle
    # haskellPackages.intero
    haskellPackages.hindent
    # haskellPackages.ghc-mod

    haskellPackages.ghcid

  ];

  hardware.opengl = {
    driSupport = true;
    driSupport32Bit = true;
  };
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.bash.enableCompletion = true;
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  system.autoUpgrade.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  programs.ssh.startAgent = true;
  programs.ssh.forwardX11 = true;
  programs.ssh.setXAuthLocation = true;
  services.sshd.enable = true;
  services.openssh.forwardX11 = true;
  services.emacs.enable = true;
  services.xrdp.enable = true;
  # services.xrdp.defaultWindowManager = "exec ${pkgs.plasma5.startkde}";
  virtualisation.docker.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable touchpad support.
  # services.xserver.libinput.enable = true;

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  # services.teamviewer.enable = true;

  fonts.fonts = with pkgs; [
    fira-code
    source-code-pro
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.jesuspc = {
    name = "jesuspc";
    group = "users";
    extraGroups = [
      "wheel" "disk" "audio" "video" "networkmanager" "systemd-journal"
      "docker"
    ];
    createHome = true;
    home = "/home/jesuspc";
    isNormalUser = true;
    uid = 1000;
    shell = pkgs.zsh;
  };

  # Needed for unity editor
  security.chromiumSuidSandbox.enable = true;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.03"; # Did you read the comment?
}
