{...}: {
  homebrew = {
    enable = true;
    formulae = [
      "docker-compose"
      "git"
      "lazygit"
      "mise"
      "neovim"
      "node"
      "parqeye"
      "podman"
      "ripgrep"
    ];
    casks = [
      "ghostty"
    ];
    masApps = {
      "Developer" = 640199958;
      "Xcode" = 497799835;
    };
  };
}
