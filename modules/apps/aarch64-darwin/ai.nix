{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    ollama
    pi-coding-agent
  ];
}
