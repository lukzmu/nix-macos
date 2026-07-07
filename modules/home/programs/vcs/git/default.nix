{...}: {
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Lukasz Zmudzinski";
        email = "lukasz@zmudzinski.me";
      };

      credential.helper = "osxkeychain";

      column.ui = "auto";
      branch.sort = "-committerdate";
      tag.sort = "version:refname";
      init.defaultBranch = "main";

      diff = {
        algorithm = "histogram";
        colorMoved = "plain";
        mnemonicPrefix = true;
        renames = true;
      };

      push = {
        default = "simple";
        autoSetupRemote = true;
        followTags = true;
      };

      fetch = {
        prune = true;
        pruneTags = true;
        all = true;
      };

      help.autocorrect = "prompt";
      commit.verbose = true;

      rerere = {
        enabled = true;
        autoupdate = true;
      };

      rebase = {
        autoSquash = true;
        autoStash = true;
        updateRefs = true;
      };

      delta.navigate = true;

      includeIf = {
        "gitdir/i:~/developer/projects/c9h/".path = "~/.config/git/config-c9h";
        "gitdir/i:~/developer/projects/stx/".path = "~/.config/git/config-stx";
      };
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };

  xdg.configFile."git/ignore".source = ./config/ignore;
  xdg.configFile."git/attributes".source = ./config/attributes;

  xdg.configFile."git/config-c9h".source = ./config/config-c9h;
  xdg.configFile."git/config-stx".source = ./config/config-stx;
}
