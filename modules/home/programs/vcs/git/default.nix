{ ... }:
{
  programs.git = {
    enable = true;

    userName = "Lukasz Zmudzinski";
    userEmail = "lukasz@zmudzinski.me";

    delta.enable = true;

    extraConfig = {
      credential.helper = "cache";

      pager = {
        log = "delta";
        reflog = "delta";
        show = "delta";
      };

      column.ui = "auto";
      branch.sort = "-commiterdate";
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

      core = {
        excludesfile = "~/.gitignore-global";
        attributesfile = "~/.gitattributes";
      };

      rebase = {
        autoSquash = true;
        autoStash = true;
        updateRefs = true;
      };
    };
  };

  home.file.".gitignore-global".source = ./gitignore-global;
  home.file.".gitattributes".source = ./gitattributes;
}
