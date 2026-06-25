{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "work"

  services.xserver.enable = true;

  services.displayManager.plasma-login-manager = {
    enable = true;
  };

  services.desktopManager.plasma6.enable = true;

  users.users = {
    ryuna = {
      isNormalUser = true;
      description = "Ryuna";
      extraGroups = [ "docker" "networkmanager" "wheel" ];
      hashedPasswordFile = "/var/lib/secrets/ryuna-password.txt";
    };

    suporte = {
      isNormalUser = true;
      description = "Suporte";
      extraGroups = [ "networkmanager" "wheel" ]; 
      hashedPasswordFile = "/var/lib/secrets/suporte-password.txt";
    };
  };

  system.stateVersion = "26.05"; 
}
