{pkgs, ...}: {
  system.stateVersion = "26.11";

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
        editor = false;
      };
      efi.canTouchEfiVariables = true;
      timeout = 3;
    };
    tmp.cleanOnBoot = true;
  };

  time.timeZone = "Europe/Warsaw";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "pl_PL.UTF-8";
      LC_MEASUREMENT = "pl_PL.UTF-8";
      LC_MONETARY = "pl_PL.UTF-8";
      LC_NAME = "pl_PL.UTF-8";
      LC_NUMERIC = "pl_PL.UTF-8";
      LC_PAPER = "pl_PL.UTF-8";
      LC_TELEPHONE = "pl_PL.UTF-8";
      LC_TIME = "pl_PL.UTF-8";
    };
  };

  console.useXkbConfig = true;
  services.xserver.xkb.layout = "pl";

  programs.zsh.enable = true;
  programs.nix-ld.enable = true;

  hardware.enableRedistributableFirmware = true;
  hardware.cpu.intel.updateMicrocode = true;
  hardware.cpu.amd.updateMicrocode = true;

  networking = {
    networkmanager.enable = true;
    firewall.enable = true;
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.printing = {
    enable = true;
    browsed.enable = false;
    # cupsd's built-in avahi client fails to resolve .local device URIs
    # (confirmed: plain NSS/getaddrinfo resolves the printer's mDNS name
    # fine, but cupsd's own avahi-client/D-Bus resolution path does not).
    # Building without avahi support makes cupsd fall back to the working
    # NSS resolution instead.
    package = pkgs.cups.override {avahi = null;};
  };
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  hardware.printers = {
    ensureDefaultPrinter = "Brother_DCP_L3550CDW";
    ensurePrinters = [
      {
        name = "Brother_DCP_L3550CDW";
        location = "Home";
        deviceUri = "ipp://BRWDCA2664A9E36.local/ipp/print";
        model = "everywhere";
        ppdOptions.PageSize = "A4";
      }
    ];
  };

  # Defense in depth: also wait for the network/avahi to be up and retry
  # on failure, in case the printer is genuinely offline at activation
  # time (the deterministic cupsd-avahi resolution bug is fixed above via
  # services.printing.package).
  systemd.services.ensure-printers = {
    wants = ["network-online.target" "avahi-daemon.service"];
    after = ["network-online.target" "avahi-daemon.service" "nss-lookup.target"];
    serviceConfig = {
      Restart = "on-failure";
      RestartSec = 30;
    };
  };

  services.fstrim.enable = true;

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };
}
