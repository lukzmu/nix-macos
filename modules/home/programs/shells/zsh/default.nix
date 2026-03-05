{...}: {
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

    shellAliases = {
      lg = "lazygit";
      img = "wezterm imgcat";
    };

    initContent = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"
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
