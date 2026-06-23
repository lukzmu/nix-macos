{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.programs.pi-coding-agent;
in {
  options.programs.pi-coding-agent = {
    enable = mkEnableOption "the pi coding agent";
  };

   config = mkIf cfg.enable {
    home.packages = [pkgs.pi-coding-agent];
    home.file.".pi/agent/settings.json" = {source = ./config/settings.json;};
    home.file.".pi/agent/models.json" = {source = ./config/models.json;};
  };
}
