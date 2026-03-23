{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/nix/programs.nix
      ./modules/nix/services.nix
      ./modules/nix/packages.nix
      ./modules/nix/overlays.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-home-personal"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "uk";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.randomasian = {
    isNormalUser = true;
    description = "randomasian";
    extraGroups = [ "networkmanager" "wheel" "input" "tty" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Experimental Features:
   # Flakes.
   nix.settings.experimental-features = [
    "nix-command"
    "flakes"
   ];
  
  # Nvidia Drivers:
   # OpenGL.
   hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      mesa
      libva-vdpau-driver
      libvdpau-va-gl
    ];
   };

   # Nvidia
   hardware.nvidia = {
    modesetting = {
      enable = true;
    };
    powerManagement = {
      enable = false;
    };
    open = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    nvidiaSettings = true;
   };

   # kernelParams
   boot.kernelParams = [
    "nvidia-drm.modeset=1"
    "nvidia_drm.fbdev=1"
    "nvidia.NVreg_RegistryDwords=PowerMizerEnable=0x1"
    "PerfLevelSrc=0x2222"
    "PowerMizerDefault=0x1"
    "PowerMizerDefaultAC=0x1"
   ];

  # kernelModules.
  boot.kernelModules = [
    "uninput"
  ];

  # Shells.
  environment.shells = with pkgs; [
    zsh
  ];
  users.defaultUserShell = pkgs.zsh;

  # Fonts.
  fonts.fontconfig = {
    enable = true;
  };
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];

  # Linked Paths.
  environment.pathsToLink = [
    "/libexec"
    "/mnt"
  ];

  # Session Variables.
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # xdg portal.
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  # Settings.
  nix.settings = {
    connect-timeout = 60;
    stalled-download-timeout = 60;
  };

  # home-manager.
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.randomasian = import ./home.nix;
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
