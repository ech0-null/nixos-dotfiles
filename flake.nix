{
    description = "My NixOS Configuration";

    # DEPENDENCIES
    inputs = {
        nixpkgs.url = "nixpkgs/nixos-26.05";

        home-manager = {
            url = "github:nix-community/home-manager/release-26.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    # OUTPUTS
    outputs = { self, nixpkgs, home-manager, ... }@inputs: {
	
	# HOST CONFIGURATIONS
	nixosConfigurations = {
      
      	    "nixos-btw" = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = { inherit inputs; }; 
                modules = [
                    ./hosts/nixos-btw/hardware-configuration.nix
                    ./hosts/nixos-btw/configuration.nix
                    home-manager.nixosModules.home-manager

					{
	            		home-manager = {
	             			useGlobalPkgs = true;
		            		useUserPackages = true;
		            		backupFileExtension = "backup";
			            	extraSpecialArgs = { inherit inputs; };
					              
		                	users.sasha = import ./users/sasha/home.nix; 
			            };
		          	}
                ];
      	    };

      	    "work" = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
		        specialArgs = { inherit inputs; }; 
		        modules = [
		          	./hosts/work/hardware-configuration.nix
		          	./hosts/work/configuration.nix
		          	home-manager.nixosModules.home-manager
		          	{
	       	          	home-manager = {
					      	useGlobalPkgs = true;
		              	  	useUserPackages = true;
		              	  	backupFileExtension = "backup";
		          	  	  	extraSpecialArgs = { inherit inputs; };
		          					              
         		      	  	users.ryuna = import ./users/ryuna/home.nix; 
         			  	};
        		  	}
		        ];
    	    };
        };
    };
}
