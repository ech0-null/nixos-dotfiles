{ config, pkgs, ... }:

{
  # --- MODULE IMPORTS ---
  imports = [
	/etc/nixos/modules/home/core-tools.nix
  ];

  # --- USER IDENTIFICATION ---
  home.username = "ryuna";
  home.homeDirectory = "/home/ryuna";

  home.packages = with pkgs; [
  	eza;
  ];
  
  programs.git = {
    enable = true;
    userName = "ryuna";
    userEmail = "uemura.ryuna@proton.me";
    
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  # --- UNIFIED GTK THEMING ---
  # Forces standard GTK applications to use the Breeze aesthetic, maintaining
  # high information density and sharp geometry across all environments.
  gtk = {
    enable = true;
    theme = {
      name = "Breeze";
      package = pkgs.kdePackages.breeze-gtk;
    };
    iconTheme = {
      name = "breeze";
      package = pkgs.kdePackages.breeze-icons;
    };
  };

  # Do not change this.
  home.stateVersion = "26.05"; 
}
