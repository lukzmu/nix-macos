{...}: {
  homebrew = {
    enable = true;
    brews = [
      "docker-compose"
      "git"
      "lazygit"
      "mise"
      "node"
      "parqeye"
      "podman"
      "ripgrep"
    ];
    casks = [
      "ghostty"
      "visual-studio-code"
    ];
  };
}
