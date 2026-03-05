{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        diskonaut
        htop
        m-cli
        starship
        tree
        zsh
    ];
}
