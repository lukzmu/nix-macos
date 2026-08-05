{...}: {
  imports = [
    ./disko.nix
    ./hardware-configuration.nix
    ./nixos.nix
  ];

  networking.hostName = "sol";
}
