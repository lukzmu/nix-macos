{
  lib,
  pkgs,
  ...
}: let
  isDarwin = pkgs.stdenv.hostPlatform.isDarwin;
in {
  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "aliases"
        "dbt"
        "git"
        "python"
      ];
    };

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases =
      {
        lg = "lazygit";
      }
      // lib.optionalAttrs isDarwin {
        img = "wezterm imgcat";
      };

    initContent =
      lib.optionalString isDarwin ''
        eval "$(/opt/homebrew/bin/brew shellenv)"
      ''
      + ''
        export PATH="$HOME/.local/bin:$PATH"
      '';
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.pyenv = {
    enable = true;
    enableZshIntegration = true;
  };
}
