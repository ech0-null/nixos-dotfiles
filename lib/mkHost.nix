# lib/mkHost.nix
{ inputs }:

{ hostName, userName }:

inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = { inherit inputs; };
    modules = [
        ../hosts/${hostName}/hardware-configuration.nix
        ../hosts/${hostName}/configuration.nix
    ];

    inputs.home-manager.nixosModules.home-manager
    {
        home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "backup";
            extraSpecialArgs = { inherit inputs; };

            users.${userName} = import ../users/${userName}/home.nix;
        };
    }
}
