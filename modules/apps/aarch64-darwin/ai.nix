{...}: {
  homebrew = {
    brews = [
      "jundot/omlx/omlx"
      "pi-coding-agent"
    ];
    casks = [
      "claude-code"
    ];
    taps = [
      {
        name = "jundot/omlx";
        clone_target = "https://github.com/jundot/omlx";
        trusted = true;
      }
    ];
  };
}
