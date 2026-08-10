{...}: {
  services.ssh-agent.enable = true;

  programs.ssh = {
    enable = true;
    settings."*".AddKeysToAgent = "yes";
  };
}
