{ ... }:
{
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
        "zsh-autosuggestions"
        "zsh-syntax-highlighting"
      ];
    };

    shellAliases = {
      lg = "lazygit";
      img = "wezterm imgcat";
    };

    initExtra = ''
      eval "$(starship init zsh)"

      export PYENV_ROOT="$HOME/.pyenv"
      [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
      eval "$(pyenv init - path)"
    '';
  };
}
