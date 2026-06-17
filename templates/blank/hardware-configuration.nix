{ ... }:
{
  # Replace these example values with your real hardware configuration.
  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };
}
