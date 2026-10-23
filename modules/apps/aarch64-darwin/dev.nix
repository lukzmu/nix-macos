{...}: {
  homebrew = {
    enable = true;
    brews = [
      "git"
      "lazygit"
      "mise"
      "node"
      "podman"
      "podman-compose"
      "ripgrep"
    ];
    casks = [
      "ghostty"
    ];
  };
}
