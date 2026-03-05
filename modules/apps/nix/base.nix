{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        htop
        m-cli
        starship
        tree
        zsh
    ];
}
