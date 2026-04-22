{...}: {
  imports = [
    ./darwin.nix
  ];

  networking.hostName = "terra";
  system.primaryUser = "lukzmu";
}
