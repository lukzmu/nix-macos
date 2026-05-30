{pkgs, ...}: {
  programs.wezterm = {
    enable = false;
    extraConfig = builtins.readFile ./config.lua;
  };
}
