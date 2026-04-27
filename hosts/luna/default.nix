{...}: {
  imports = [
    ./darwin.nix
  ];

  networking.hostName = "luna";
  system.primaryUser = "lukasz.zmudzinski@stxnext.pl";
}
