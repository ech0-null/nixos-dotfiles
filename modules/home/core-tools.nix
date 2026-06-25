# Core tools and programs to be used on every machine

{ pkgs, ... }:

# Programs with relevant Nix Options
{
	programs = {

		eza = {
			enable = true;
			git = true;
			icons = "auto";
			colors = "auto";

			extraOptions = [
				"--long"
				"--all"
				"--tree"
				"--level=2"
				"--group-directories-first"
			];
		};
	
		firefox = {
			enable = true;
		
			policies = {
				DisableAppUpdate = true;
				DisableFirefoxAccounts = true;
				DisableMasterPasswordCreation = true;
				DisableTelemetry = true;
				DisablePocket = true;
			};
		};

		hyfetch = {
			enable = true;

			settings = {
				backend = "fastfetch";
				preset = "transgender";
				light_dark = "dark";
				mode = "rgb";
				pride_month_disable = true;
				peide_month_show = [ 2026 ];
				
				color_align = {
	         		mode = "horizontal";
		        };
			};
		};

		zsh = {
			enable = true;
			enableCompletion = true;
			
			autosuggestion.enable = true;
			syntaxHighlighting.enable = true;
		};
	};

# General software

  	home.packages = with pkgs; [
    	btop
    	fzf
    	ripgrep
    	fd
    	jq
    	unzip
    	fastfetch
    	macchina
  ];
}
