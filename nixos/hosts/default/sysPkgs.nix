{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.zsh = {
    enable = true;
    histSize = 10000;
    histFile = "$HOME/.histfile";
    ohMyZsh = {
      enable = true;
      plugins = [ "git" "sudo"];
      theme = "flazz";
    };
    shellAliases = {
        vim = "nvim";
    	updater = "sudo nixos-rebuild switch --flake $HOME/git/GitHub/dotfiles/nixos/#default";
	rollback = "sudo nixos-rebuild --rollback switch";
	nixgc = "nix-collect-garbage";
    };
    loginShellInit = ''
#!${pkgs.zsh}/bin/zsh
[ "$(tty)" = "/dev/tty1" ] && exec ${pkgs.hyprland}/bin/Hyprland
    '';
    interactiveShellInit = ''
gitsw() {
	if [ "$1" = "main" ] || [ "$1" = "master" ]
	then
		git switch "$1"
		git pull
	elif [ "$1" = "-c" ]
	then
		git switch "$1" nogarremi/"$2"
	elif [ "$1" = "" ]
	then
		git switch main
		git pull
	else
		git switch "$1"
	fi
}

gitsend() {
	git add .
	if [ "$1" = "-f" ]
	then
		git commit --allow-empty-message --squash=$(git rev-parse --short HEAD) -m ""
		git -c sequence.editor=: rebase -i --autosquash HEAD~2 <<EOF
:wq
EOF
		git push -f origin $(git branch --show-current)
	else
		git commit -m "$1"
		git push origin $(git branch --show-current)
	fi
}

GPG_TTY=$(tty)
export GPG_TTY
eval "$(zoxide init --cmd cd zsh)"
    '';
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
    fzf
    zoxide
    kitty
    blueman
    cloudflared
  ];
}
