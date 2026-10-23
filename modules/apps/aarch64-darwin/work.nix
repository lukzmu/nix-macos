{...}: {
  homebrew = {
    enable = true;
    brews = [
      "lazysql"
      "mysql"
      "parqeye"
    ];
    casks = [
      "bitwarden"
      "dbeaver-community"
      "gcloud-cli"
      "google-chrome"
      "slack"
      "tailscale"
    ];
  };
}
