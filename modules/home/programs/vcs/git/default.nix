{ ... }:
{
  programs.git = {
    enable = true;

    settings = {
      user = {
      	name = "Lukasz Zmudzinski";
	email = "lukasz@zmudzinski.me";
      };

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

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };

  home.file.".gitignore-global".source = ./gitignore-global;
  home.file.".gitattributes".source = ./gitattributes;
}
