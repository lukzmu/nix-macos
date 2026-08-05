{ config, ... }: let
  onePassPath = "${config.home.homeDirectory}/.1password/agent.sock";
in {
  home.sessionVariables.SSH_AUTH_SOCK = onePassPath;
  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host *
          IdentityAgent ${onePassPath}
    '';
  };
}
