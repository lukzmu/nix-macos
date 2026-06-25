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
    # NOTE: The claude-code binary is provided by the apps layer via Homebrew cask
    # (modules/apps/aarch64-darwin/ai.nix). This home module only manages configuration.
    home.packages = [pkgs.jq];

    home.file.".claude/settings.json" = {source = ./config/.claude/settings.json;};

    home.file.".claude/statusline-command.sh" = {
      source = ./config/statusline-command.sh;
      executable = true;
    };

    # WARNING: ~/.claude/agents is a read-only Nix store symlink. Claude Code cannot
    # write new agents here at runtime. Any changes require modifying the source in
    # config/.claude/agents/ and running darwin-rebuild switch.
    home.file.".claude/agents".source = ./config/.claude/agents;
  };
}
