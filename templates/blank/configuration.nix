{ pkgs, ... }:
{
  system.stateVersion = "24.11";

  # Basic bootloader defaults.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  time.timeZone = "UTC";

  # Add packages to install globally.
  environment.systemPackages = with pkgs; [ ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
}
