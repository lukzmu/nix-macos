{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.programs.claude-code-agent;
in {
  options.programs.claude-code-agent = {
    enable = mkEnableOption "the Claude Code agent";
  };

  config = mkIf cfg.enable {
    home.packages = [pkgs.jq];

    home.file.".claude/settings.json" = {source = ./config/.claude/settings.json;};

    home.file.".claude/statusline-command.sh" = {
      source = ./config/statusline-command.sh;
      executable = true;
    };

    home.file.".claude/agents".source = ./config/.claude/agents;
    home.file.".claude/rules".source = ./config/.claude/rules;
    home.file.".claude/skills".source = ./config/.claude/skills;
  };
}
