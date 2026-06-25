{...}: {
  imports = [
    ../programs/agents/claude
  ];

  programs.claude-code-agent.enable = true;
}
