{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    ollama
  ];
  homebrew = {
    casks = [
      "claude-code"
    ];
  };
}
