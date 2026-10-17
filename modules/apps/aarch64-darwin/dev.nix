{...}: {
  homebrew = {
    enable = true;
    brews = [
      "docker-compose"
      "git"
      "lazygit"
      "mise"
      "node"
      "podman"
      "ripgrep"
    ];
    casks = [
      "ghostty"
    ];
  };
}
