{
    description = "My NixOS Configuration powered by flake-parts";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
        
        flake-parts.url = "github:hercules-ci/flake-parts";

        home-manager = {
            url = "github:nix-community/home-manager/release-26.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nix-wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";
        import-tree.url = "github:denful/import-tree";
    };

    outputs = inputs@{ flake-parts, ... }: flake-parts.lib.mkFlake { inherit inputs; } {
      
        systems = [ "x86_64-linux" ];

        flake = 
        let
            mkHost = import ./lib/mkHost.nix { inherit inputs; };
        in 
        {
            nixosConfigurations = {
                "nixos-btw" = mkHost { hostName = "nixos-btw"; userName = "sasha"; };
                "work" = mkHost { hostName = "work"; userName = "ryuna"; };
            };
        };
    };
}

# GOAL:
#nixos-dotfiles/
#├── flake.nix
#├── hosts/
#│   ├── nixos-btw/
#│   │   ├── default.nix
#│   │   └── hardware-configuration.nix
#│   └── work/
#│       ├── default.nix
#│       └── hardware-configuration.nix
#└── modules/
#    ├── core/
#    │   └── default.nix
#    └── desktop/
#        ├── budgie/
#        │   ├── default.nix
#        │   └── autostart.sh
#        └── terminal/
#            ├── default.nix
#            └── alacritty.toml # Native Alacritty config