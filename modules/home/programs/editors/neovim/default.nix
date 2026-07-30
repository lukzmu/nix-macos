{...}: {
  programs.neovim = {
    # Disabled as I don't use neovim anymore,
    # but don't want to remove my configurations
    enable = false;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  xdg.configFile."nvim".source = ./config;
}
