{ config, lib, pkgs, ... }:

{
	imports = [
		./hardware-configuration.nix
	];

	boot = {
		loader = {
			systemd-boot.enable = true;
			efi.canTouchEfiVariables = true;
			timeout = 10;
		};

		plymouth = {
			enable = true;
			theme = "bgrt";
		};

		kernelParams = [
			"quiet"
			"splash"
			"boot.shell_on_fail"
			"loglevel=3"
			"rd.systemd.show_status=false"
			"rd.udev.log_level=3"
			"udev.log_priority=3"
		];

		consoleLogLevel = 0;
		initrd.verbose = false;
		initrd.kernelModules = [ "amdgpu" ];
	};

	networking.hostName = "nixos-btw";
	networking.networkmanager.enable = true;

	time.timeZone = "America/Cuiaba";

	services.xserver = {
		enable = true;
		autoRepeatDelay = 200;
		autoRepeatInterval = 35;
	};

	services.desktopManager.gnome.enable = true;
	services.displayManager.gdm.enable = true;

	services.xserver.xkb.layout = "br";
	services.xserver.xkb.variant = "abnt2";
	console.useXkbConfig = true;

	services.pipewire = {
		enable = true;
		pulse.enable = true;
	};

	services.libinput.enable = true;

	users.users.sasha = {
		isNormalUser = true;
		hashedPasswordFile = "/var/lib/secrets/password.txt";
		extraGroups = [ "wheel" "networkmanager" "docker" ];
	};

	programs.firefox.enable = true;
	programs.vim.enable = true;
	programs.git.enable = true;
	programs.zsh.enable = true;

	environment.systemPackages = with pkgs; [
		curl
		wget
	];

	 fonts.packages = with pkgs; [
	   nerd-fonts.jetbrains-mono
	 ];

	 nix.settings.experimental-features = [ "nix-command" "flakes" ];

	 system.stateVersion = "26.05";

}

