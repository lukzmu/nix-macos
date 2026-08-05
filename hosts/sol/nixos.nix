{...}: {
  hardware.nvidia-gpu = {
    enable = true;
    open = true;
    branch = "stable";
  };

  zramSwap.enable = true;
}
