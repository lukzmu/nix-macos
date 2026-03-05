{ pkgs, ... }: {
  system.activationScripts.defaultBrowser.text = ''
    ${pkgs.m-cli}/bin/m browser brave || true
  '';
}
