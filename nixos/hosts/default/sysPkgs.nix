{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.zsh = {
    enable = true;
    histSize = 10000;
    histFile = "$HOME/.histfile";
    ohMyZsh.enable = true;
    shellAliases = {
    	updater = "sudo nixos-rebuild switch --flake $HOME/git/GitHub/dotfiles/nixos/#default";
	rollback = "sudo nixos-rebuild --rollback switch";
    };
  };

  # Permitted insecure packages
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    open-vm-tools
    vmware-workstation
    zsh
    kitty
    blueman
    cloudflared
  ];
}
