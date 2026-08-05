{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.hardware.nvidia-gpu;
in {
  options.hardware.nvidia-gpu = {
    enable = lib.mkEnableOption "the NVIDIA graphics stack";

    open = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = ''
        Use the open kernel modules. Required on Blackwell (RTX 50xx) and
        recommended on Turing and newer (RTX 20xx / GTX 16xx). Set to false
        for Maxwell, Pascal and Volta (GTX 9xx / 10xx), and pair that with
        branch = "legacy_580". There is no safe default upstream: the module
        asserts if this is left unset on drivers 560 and newer.
      '';
    };

    branch = lib.mkOption {
      type = lib.types.str;
      default = "stable";
      example = "production";
      description = ''
        Driver branch. Useful values: "stable", "production", "beta",
        "latest", "bleeding_edge", "legacy_580" (Maxwell to Volta),
        "legacy_470" (Kepler).
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    services.xserver.videoDrivers = ["nvidia"];

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    hardware.nvidia = {
      inherit (cfg) open branch;
      modesetting.enable = true;
      nvidiaSettings = true;
      videoAcceleration = true;
    };

    boot.kernelModules = ["nvidia" "nvidia_modeset" "nvidia_drm"];
    boot.initrd.kernelModules = ["nvidia" "nvidia_modeset" "nvidia_drm"];

    environment.sessionVariables = {
      LIBVA_DRIVER_NAME = "nvidia";
      NVD_BACKEND = "direct";
    };

    environment.systemPackages = with pkgs; [
      libva-utils
      vulkan-tools
      nvtopPackages.nvidia
    ];
  };
}
