{ config, pkgs, ... }:

{
    home.username = "sasha";
    home.homeDirectory = "/home/sasha";
    home.stateVersion = "26.05";
    programs.zsh.enable = true;
}
