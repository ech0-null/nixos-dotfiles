{ config, pkgs, ... }:

{
	imports = [
		../../modules/home/core-tools.nix
	];

    home.username = "sasha";
    home.homeDirectory = "/home/sasha";
    home.stateVersion = "26.05";

    programs.zsh.enable = true;
    programs.micro.enable = true;

    programs.git = {
		enable = true;
		userName = "ech0-null";
		userEmail = "uemura.ryuna@proton.me";
		lfs.enable = true;	
    };

    programs.gh = {
    	enable = true;
    	gitCredentialHelper.enable = true;	
    };
}
