{...}: {
  homebrew = {
    enable = true;
    brews = [
      "docker-compose"
      "git"
      "k9s"
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
    ];
  };
}
