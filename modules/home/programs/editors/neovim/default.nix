{
  config,
  pkgs,
  flakeRoot,
  ...
}: {
  home.packages = [pkgs.neovim];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  home.shellAliases = {
    vi = "nvim";
    vim = "nvim";
  };

  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink
    "${flakeRoot}/modules/home/programs/editors/neovim/config";
}
