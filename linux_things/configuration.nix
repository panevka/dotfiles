{ config, lib, pkgs, ... }:

let
  secrets = import ./secrets.nix;
  unstable = import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
  }) 
  {
    system = pkgs.system;
  };
in {
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

   #################
  #                 #
  #   OS SETTINGS   #
  #                 #
   ################# 

  # systemd bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_6_6;

  # network manager
  networking.networkmanager.enable = true;

  # time zone
  time.timeZone = "Europe/Warsaw";

  # user configuration
  users.users.shef = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  boot.extraModulePackages = with config.boot.kernelPackages; [
    rtl8192eu
  ];

  # swap config
  swapDevices = [{
    device = "/swapfile";
    size = 16 * 1024; # 16GB
  }];


  boot.kernelModules = [ "rtl8192eu" ];

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # allow proprietary packages e.g. nvidia drivers
  nixpkgs.config.allowUnfree = true;
  hardware.enableRedistributableFirmware = true;

   #################################
  #                                 #
  #   USER PROGRAMS CONFIGURATION   #
  #                                 #
   #################################

  # browser
  programs.firefox = {
    enable = true;

    policies = {
      ExtensionSettings = {
        "*".installation_mode = "blocked"; # optional: block everything else

        # uBlock Origin
        "uBlock0@raymondhill.net" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
        };

        # Vimium
        "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
        	  installation_mode = "force_installed";
        	  install_url = "https://addons.mozilla.org/firefox/downloads/latest/vimium-ff/latest.xpi";
        };

        # Bitwarden Password Manager
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
        	  installation_mode = "force_installed";
        	  install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
        };

      };
    };
  };

  # programs.git

   #################################
  #                                 #
  #   GRAPHICS/UI/DISPLAY MANAGER   #
  #                                 #
   #################################

  # nvidia drivers configuration
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  boot.blacklistedKernelModules = [ "nouveau" "rtl8xxxu" ];
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
  };

  # display manager
  services.xserver.enable = true;
  programs.xwayland.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.enable = true;
  programs.niri.enable = true;


  fonts =
  {
    enableDefaultPackages = true;

    packages = with pkgs; [
        nerd-fonts.ubuntu
    ];

    fontconfig =
    {
      enable = true;

      defaultFonts =
      {
        monospace = [ "pkgs.nerd-fonts.ubuntu-mono" ];
        sansSerif = [ "pkgs.nerd-fonts.ubuntu-sans" ];
        serif = [ "pkgs.nerd-fonts.ubuntu" ];

      };
    };
  };


   #################################
  #                                 #
  #          CONFIGS                #
  #                                 #
   #################################


   #################################
  #                                 #
  #          PACKAGES               #
  #                                 #
   #################################

  environment.systemPackages = with pkgs; [
    vim                     # code editor
    alacritty               # terminal
    firefox                 # browser
    lunarvim                # better code editor :D
    helix                   # even better code editor
    opencode                # vibecoding stuff
    vesktop                 # better discord client
    git                     # second best version manager (after SVN)
    cryptsetup              # for LUKS participation unlocking
    tmux 	                  # terminal tiling
    btop                    # task/process manager
    obsidian                # note taker, mind management app :)
    toybox                  # utilities like lspci, base64, ascii, cat, chroot, date, echo, find, httpd, kill (not all are included in nixos)
    bitwarden-desktop       # secret management
    ente-auth               # 2fa management
    nixd                    # nix language server
    zig                     # C but better


    # wifi
    net-tools

    # niriwm and related dependencies
    niri
    unstable.dms-shell      # dank material shell
    quickshell              # toolkit for building status bars, widgets, lockscreens etc. (dependency of Niri)
    mako                    # wayland notification daemon
    swaybg                  # wallpaper
    swaylock                # screen lock
    xwayland-satellite      # xwayland support for any wayland compositor
    udiskie                 # auto-mounter for removable media e.g. pendrives
    fuzzel                  # app launcher and fuzzy finder
    xclip                   # clipboard integration
  ];
}


