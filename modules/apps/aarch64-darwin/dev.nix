{...}: {
  homebrew = {
    enable = true;
    brews = [
      "docker-compose"
      "git"
      "lazygit"
      "lazysql"
      "mise"
      "node"
      "parqeye"
      "podman"
      "ripgrep"
    ];
    casks = [
      "dbeaver-community"
      "ghostty"
      "slack"
    ];
    masApps = {
      "Xcode" = 497799835;
    };
  };
}
